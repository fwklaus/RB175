require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

# Sinatra serves any file placed in a public directory that lives in the same directory as the Sinatra app

# You can use the file extension in the url to serve it directly

# The first route that matches a request is invoked
get "/img" do
  # image in the public directory
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

# a named parameter (ie :sort_order) is accessed via the block parameter
    # can also be accessed via the params hash - ie params['sort_order']
# the named parameter does not name a file
    # can almost think of it as a case statement
    # the symbol names the condition we want to test

get "/:sort_order" do |n|
  @contents = Dir.children("public")
  if n == "ascending"
    @contents = @contents.sort{ |a,b| a <=> b}
  else
    @contents = @contents.sort{ |a,b| b <=> a}  
  end

  erb :contents
end



