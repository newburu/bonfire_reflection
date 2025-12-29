require "net/http"
require "uri"
require "json"

class GeminiService
  API_ENDPOINT = "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent"

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

    uri = URI("#{API_ENDPOINT}?key=#{@api_key}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri)
    request["Content-Type"] = "application/json"
    request.body = {
      contents: [ {
        role: "user",
        parts: [ { text: prompt } ]
      } ]
    }.to_json

    response = http.request(request)

    if response.code == "200"
      json = JSON.parse(response.body)
      # 候補があるか確認
      if json["candidates"] && json["candidates"].first && json["candidates"].first["content"]
        json["candidates"].first["content"]["parts"].first["text"]
      else
        nil
      end
    else
      Rails.logger.error("GeminiService API Error: #{response.code} - #{response.body}")
      nil
    end
  rescue => e
    Rails.logger.error("GeminiService Error: #{e.message}")
    nil
  end
end
