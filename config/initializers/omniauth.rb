Rails.application.config.middleware.use OmniAuth::Builder do
  provider :foursquare,  APP_CONFIG['foursquare_key'], APP_CONFIG['foursquare_secret'], :scope => 'email'
end