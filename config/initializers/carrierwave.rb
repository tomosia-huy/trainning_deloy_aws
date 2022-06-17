CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_SECRET_KEY_ID'],
      :region                 => ENV['S3_REGION']
  }
  config.fog_public = true
  config.enable_processing = false
  config.fog_directory = ENV['S3_BUCKET']
  config.cache_storage = :fog
end
