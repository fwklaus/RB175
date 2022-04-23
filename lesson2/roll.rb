require "socket"

server = TCPServer.new("localhost", 3003)

def parse_request(req_line)
  http_method, path, version = req_line.split(" ") 
  params = {}

  path, query_string = path.split("?")
  query_str = query_string.split("&")
  
  query_str.each do |str|
    key, value = str.split("=")
    params[key] = value
  end

  [http_method, path, params]
end

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)
    
  # response headers and body
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"  

  #client.puts request_line
  
  client.puts "<h1>Rolls!</h1>"  
  rolls = params["rolls"].to_i
  sides = params["sides"].to_i

  rolls.times do |_|
    roll = rand(sides) + 1 # prints random number between 1 and sides  
    client.puts "<p>", roll, "</p>"
  end

  client.puts "</body>"
  client.puts "</html>"

  client.close
end 
