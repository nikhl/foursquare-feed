class User
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :name, type: String
  field :provider, type: String
  field :uid, type: String
  field :email, type: String
  field :uname, type: String
  field :oauth_token, type: String
  
  embeds_many :posts

   def self.create_from_omniauth(auth)
    create! do |user|
      user.provider    = auth.provider
      user.uid         = auth.uid
      user.name        = auth.info.name
      user.uname       = auth.info.nickname
      user.email       = auth.info.email
      user.oauth_token = auth.credentials.token
    end
  end

  def self.find_by_provider_and_uid(provider, uid)
    User.where(:provider => provider, :uid => uid).first
  end

end
