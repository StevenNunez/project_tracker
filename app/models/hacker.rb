class Hacker < ActiveRecord::Base
  def self.find_or_create_from_github(auth_hash)
    Hacker.where(auth_hash.slice("provider", "uid")).first_or_initialize.tap do |u|
      u.name = auth_hash.dig("info", "name")
      u.image = auth_hash.dig("info", "image")
      u.token = auth_hash.dig("credentials", "token")
      u.save
    end
  end
  def client
    @client ||= Octokit::Client.new(:access_token => self.token)
  end
end
