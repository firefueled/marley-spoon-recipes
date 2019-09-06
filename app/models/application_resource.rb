require 'contentful'

class ApplicationResource

  space_id = Rails.application.credentials.contentful[:space_id]
  token = Rails.application.credentials.contentful[:token]
  @@client = Contentful::Client.new(
    space: space_id,
    access_token: token,
    api_url: 'cdn.contentful.com',
    raise_for_empty_fields: false
  )

  def self.all
    @@client.entries
  end

  def self.find(id)
    @@client.entry id
  end
end
