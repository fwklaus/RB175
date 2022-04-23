require "socket" # contains classes we can use to create and interact with servers, perform networking tasks

server = TCPServer.new("localhost", 3003) # creating a server object named "local host" on port 3003
loop do
  client = server.accept # method call waits for request to server, accepts it, opens connection with client, returns client object used to interact with remote system
  
  request_line = client.gets # method call gets first line of request
  puts request_line # print request-line to console

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain\r\n\r\n"
  client.puts request_line # send request-line to client so it appears in the web browser
  client.close # close connection
end

# loop runs until program exits for some reason or process running inside is killed by a user
