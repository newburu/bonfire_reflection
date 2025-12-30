require "net/http"
require "json"
require "uri"

api_key = ENV["GEMINI_API_KEY"]
url = URI("https://generativelanguage.googleapis.com/v1beta/models?key=#{api_key}")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
response = http.request(request)

if response.code == "200"
  models = JSON.parse(response.body)["models"]
  puts "取得日時: #{Time.now}"
  puts "--- 利用可能なモデル一覧 ---"
  models.each do |model|
    # generateContentメソッドをサポートしているもののみ表示
    if model["supportedGenerationMethods"].include?("generateContent")
      puts "- #{model["name"].sub('models/', '')}" # "models/" プレフィックスを除去して表示
    end
  end
else
  puts "Error: #{response.code} - #{response.body}"
end
