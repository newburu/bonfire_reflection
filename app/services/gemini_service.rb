require "net/http"
require "uri"
require "json"

class GeminiService
  # 優先モデルリスト（性能が高い順 -> 軽量・フォールバック順）
  ORDERED_MODELS = [
    "gemini-3-flash-preview",
    "gemini-2.5-pro",
    "gemini-2.5-flash",
    "gemini-2.0-flash",
    "gemini-2.5-flash-lite",
    "gemma-3-1b-it"
  ].freeze

  def initialize
    @api_key = ENV["GEMINI_API_KEY"]
  end

  def generate_question(reflection_content, user_strengths, past_reflections = [])
    strengths_text = user_strengths.empty? ? "特になし" : user_strengths.map(&:name).join("、")

    past_context = if past_reflections.any?
      "## 過去の会話（新しい順）\n" + past_reflections.map { |r| "- #{r.content}" }.join("\n")
    else
      "## 過去の会話\n特になし"
    end

    prompt = <<~PROMPT
      あなたは、焚き火を囲んで語り合う、親身で思慮深いパートナーです。
      ユーザーの「強み（資質）」と「過去の振り返り」を踏まえ、
      今回のリフレクションに対して、共感のこもった返答と、気づきを深める問いかけを行ってください。

      ## ユーザーの強み
      #{strengths_text}

      #{past_context}

      ## 今回のリフレクション
      #{reflection_content}

      ## 制約
      - まるで焚き火の横で話しているような、穏やかで温かいトーンで話しかけてください。
      - 最初の一言は、ユーザーの気持ちに寄り添う共感の言葉（感想）から始めてください。
      - その後、ユーザーの強みを活かす視点や、新しい視点を提供する「問いかけ」を投げかけてください。
      - 全体で2〜3文程度にまとめてください。長すぎないように。
      - 返答は話し言葉（です・ます調）で、自然な会話形式にしてください。
    PROMPT

    ORDERED_MODELS.each do |model|
      result = call_api(model, prompt)
      return result if result
      # 失敗した場合は次のモデルへ (ループ継続)
    end

    # 全モデル失敗時
    Rails.logger.error("GeminiService: All models failed.")
    nil
  end

  private

  def call_api(model, prompt)
    url = "https://generativelanguage.googleapis.com/v1beta/models/#{model}:generateContent"
    uri = URI("#{url}?key=#{@api_key}")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.read_timeout = 10 # タイムアウト設定

    request = Net::HTTP::Post.new(uri)
    request["Content-Type"] = "application/json"
    request.body = {
      contents: [ {
        role: "user",
        parts: [ { text: prompt } ]
      } ]
    }.to_json

    begin
      response = http.request(request)

      if response.code == "200"
        json = JSON.parse(response.body)
        if json["candidates"] && json["candidates"].first && json["candidates"].first["content"]
          content = json["candidates"].first["content"]["parts"].first["text"]
          Rails.logger.info("GeminiService: Success with #{model}")
          content
        end
      elsif response.code == "429" || response.code == "503"
        Rails.logger.warn("GeminiService: #{model} quota exceeded or unavailable (#{response.code}). Switching to next model...")
        nil
      else
        Rails.logger.error("GeminiService: #{model} API Error: #{response.code} - #{response.body}")
        nil
      end
    rescue => e
      Rails.logger.error("GeminiService: #{model} Connection Error: #{e.message}")
      nil
    end
  end
end
