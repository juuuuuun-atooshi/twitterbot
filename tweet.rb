require 'twitter'
require 'yaml'
require 'dotenv'

class Tweet

  def initialize
    config = YAML.load_file("config.yml")
    Dotenv.load

    @text = config["tweet"]["message"]

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end

  end

  def random_tweet
    tweet = @text[rand(@text.length)]
    update(tweet)
  end

  private

    def update(tweet)
      begin
        @client.update(tweet)
      rescue => e
        nil #TODO
      end
    end
end

if __FILE__ == $0
  Tweet.new.random_tweet
end
