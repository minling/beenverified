Resque.logger.formatter = Resque::QuietFormatter.new

if Rails.env == 'production'
    uri = URI.parse(ENV["REDISTOGO_URL"])
    Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  end