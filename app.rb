require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require "net/http"
require "uri"



get "/" do
    erb :first
end

get"/index" do
    erb :index
end

get "/winter" do
    erb :winter
end

get "/spring" do
    erb :spring
end

get "/summer" do
    erb :summer
end


get "/:season/:keyword" do
 base_url ="http://wikipedia.simpleapi.net/api?output=html&keyword="
 keyword = URI.escape(params[:keyword])
 url = URI.parse(base_url+keyword)
 @result = Net::HTTP.get(url).force_encoding("UTF-8")
@season  = params[:season]
 erb :result
end



