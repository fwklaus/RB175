require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/img" do
  "<img src='1.jpg'/>"
end

get "/" do
  @contents = Dir.children("public")
  erb :contents
end

get "/identifier" do
  "You don't need to see this"
end

get "/hello_world" do
  erb :hello_world
end

get "/intro" do
  erb :intro
end

get "/hello_website" do
  erb :hello_website
end

get "/img2" do
  "<img src='basquiat_painting.jpg'/>"
end

get "/abcs" do
  @alphabet = ("A".."Z").to_a
  erb :abcs
end

get "/:sort_order" do |n|
  @contents = Dir.children("public")
  if n == "ascending"
    @contents = @contents.sort{ |a,b| a <=> b}
  else
    @contents = @contents.sort{ |a,b| b <=> a}  
  end

  erb :contents
end



