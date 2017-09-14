require_relative 'src/api_server'

app = Rack::Builder.app do
  use Rack::CommonLogger
  use Rack::ShowExceptions
  
  map "/data" do
    use Rack::Lint
    run lambda { |env| CCDataFetcher::ApiServer.data(env) }
  end

  map "/latest" do
    use Rack::Lint
    run lambda { |env| CCDataFetcher::ApiServer.latest(env) }
  end
end

run app 
