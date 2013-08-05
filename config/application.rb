require 'securerandom'

module HAT
  class Application < Hobbit::Base
    Dir[File.join('config', 'initializers', '**/*.rb')].each { |file| require File.expand_path(file) }
    Dir[File.join('app', 'controllers', '**/*.rb')].each { |file| require File.expand_path(file) }
    Dir[File.join('app', 'models', '**/*.rb')].each { |file| require File.expand_path(file) }

    use BetterErrors::Middleware if ENV['RACK_ENV'].to_sym == :development
    use Rack::Session::Cookie, secret: SecureRandom.hex(64)
    # must be used after Rack::Session::Cookie
    use Rack::Protection, except: :http_origin

    map '/assets' do
      environment = Sprockets::Environment.new
      environment.append_path 'app/assets/javascripts'
      environment.append_path 'app/assets/stylesheets'
      run environment
    end

    map('/') { run RootController.new }
  end
end
