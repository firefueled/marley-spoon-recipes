class Recipe < ApplicationResource
  def self.all
    super.select do |entry|
      entry.fields.dig(:title)
    end
  end
end
