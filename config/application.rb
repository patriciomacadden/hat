require 'securerandom'

module HAT
  class Application < Hobbit::Base
    Dir[File.join('app', 'controllers', '**/*.rb')].each { |file| require File.expand_path(file) }
    Dir[File.join('app', 'models', '**/*.rb')].each { |file| require File.expand_path(file) }

    use Rack::Session::Cookie, secret: SecureRandom.hex(64)
    use Rack::Static, root: 'public', urls: ['/images', '/javascripts', '/stylesheets']
    use Rack::Protection, except: :http_origin

    map('/') { run RootController.new }
  end
end