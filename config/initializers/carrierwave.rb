CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['aws_key'],
      :aws_secret_access_key  => ENV['aws_secret_key'],
      :region                 => 'ap-southeast-1'
  }
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory  = 'woeishyong'
  config.fog_public = false
  config.fog_authenticated_url_expiration = 10
  config.fog_use_ssl_for_aws = true

end
