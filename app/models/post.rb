class Post
  include Mongoid::Document
  include Mongoid::Paranoia

  field :content, type: String
  field :type, type: String
  field :created_at, type: Integer
  
  embedded_in :user
  index "created_at" => 1

  def self.pull_checkins(user)
    client = Foursquare2::Client.new(:oauth_token => user.oauth_token)
    latest_record = user.posts.first
    if latest_record
      last_updated_at = latest_record.created_at + 50
    else
      last_updated_at = 0
    end
    client.user_checkins({:afterTimestamp => last_updated_at, :limit => 500}).items.each do |checkin|
      user.posts.create!(type: "checkin", content: checkin.venue.name, created_at: checkin.createdAt)
    end
  end

end
