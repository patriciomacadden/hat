ENV['RACK_ENV'] = 'test'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require File.expand_path('../../config/application', __FILE__)
