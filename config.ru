require 'dotenv'
Dotenv.load

require_relative 'app.rb'

run Sinatra::Application
