class OxfordService

  private

  def conn
    Faraday.new(
                url: "https://od-api.oxforddictionaries.com/api/v1",
                headers: {"app_id" = "de96332b", "app_key" = "95568bc32d6b7631660d990fb2e3d198", "Accept" = "application/json"
                } do |faraday|
      faraday.adapter Faraday.default_adapter
    end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
