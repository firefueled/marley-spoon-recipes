class ApplicationResource
  include HTTParty
  format :json

  space_id = Rails.application.credentials.contentful[:space_id]
  token = Rails.application.credentials.contentful[:token]
  @@endpoint = "https://cdn.contentful.com/spaces/#{space_id}/entries"
  @@options = {
    headers: {
      'Authorization': "Bearer #{token}"
    }
  }

  def self.all
    res = HTTParty.get(@@endpoint, @@options)
    res_items = JSON.parse(res.parsed_response)['items']

    parse_items res_items
  end

  def self.find(id)
    res = HTTParty.get(URI.join(@@endpoint, id), @@options)
    res_item = JSON.parse(res.parsed_response)
    parse_item res_item
  end

  private

  def self.parse_item json_item
    sys = json_item['sys']
    fields = json_item['fields']

    recipe = {
      id: sys['id'],
      createdAt: sys['createdAt'],
      updatedAt: sys['updatedAt']
    }

    fields.each_pair do |key, val|
      recipe[key] = val
    end

    recipe
  end

  def self.parse_items json_items
    json_items.map do |json_item|
      parse_item json_item
    end
  end
end
