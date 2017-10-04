require 'bundler'
require 'securerandom'

Bundler.require :default, ENV['RACK_ENV'].to_sym

module HAT
  class Application < Hobbit::Base
    Dir[File.join('config', 'initializers', '**/*.rb')].each { |file| require File.expand_path(file) }

    controller_files = Dir[File.join('app', 'controllers', '**/*.rb')]
    app_controller = controller_files.detect { |file| file.match %r|application_controller| }
    controller_files.delete(app_controller)
    controller_files.unshift(app_controller)
    controller_files.each { |file| require File.expand_path(file) } 

    Dir[File.join('app', 'models', '**/*.rb')].each { |file| require File.expand_path(file) }

    use BetterErrors::Middleware if ENV['RACK_ENV'].to_sym == :development
    use Rack::Session::Cookie, secret: SecureRandom.hex(64)
    # must be used after Rack::Session::Cookie
    use Rack::Protection, except: :http_origin

    map '/assets' do
      environment = Sprockets::Environment.new
      environment.append_path 'app/assets/images'
      environment.append_path 'app/assets/javascripts'
      environment.append_path 'app/assets/stylesheets'
      run environment
    end

    map('/') { run RootController.new }
  end
end
