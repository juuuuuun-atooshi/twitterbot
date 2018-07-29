require 'sinatra'
require_relative 'tweet.rb'

get '/random_tweet' do
  Tweet.new.random_tweet
end
