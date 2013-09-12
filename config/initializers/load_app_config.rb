require 'ostruct' # To convert configuration to object

APP_CONFIG =
  if File.exists?("#{Rails.root}/config/app_config.yml")
    raw_config = File.read("#{Rails.root}/config/app_config.yml")
    YAML.load(raw_config)[Rails.env].symbolize_keys
  else
    { :site_title => ENV['SITE_TITLE'], :domain => ENV['SITE_DOMAIN']}
  end

AppConfig = OpenStruct.new(APP_CONFIG)