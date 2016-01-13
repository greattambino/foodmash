class WelcomeController < ApplicationController
  def index
    consumer_key    = ENV["consumer_key"]
    consumer_secret = ENV["consumer_secret"]
    token           = ENV["token"]
    token_secret    = ENV["token_secret"]

    api_host = "http://api.yelp.com"

    consumer = OAuth::Consumer.new(
      consumer_key,
      consumer_secret,
      { site: api_host })

    access_token = OAuth::AccessToken.new(consumer, token, token_secret)

    path = "/v2/search/?term=restaurants&location=SanFrancisco,CA"

    @jresp = JSON.parse(access_token.get(path).body)
  end
end
