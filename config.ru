require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require File.expand_path('../config/application', __FILE__)

run HAT::Application.new

