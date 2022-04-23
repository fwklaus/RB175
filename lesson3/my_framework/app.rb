# HelloWorld class will act as our web application
# Most of our application code will be here
# Fulfills the requirements of a Rack Application:
      # Object responds to call(env) - takes environmental variable argument
      # returns an array - 3 elements
          # status code
          # headers - name-value pairs as key-value pairs of hash
          # response body - object that responds to each, yields string values

require_relative 'monroe'   # loads framework
require_relative 'advice'   # loads advice.rb

# Our web application
# Focuses solely on handling the request and creating a return response
class App < Monroe 
  # Inherits methods defined in framework `Monroe`:
    # response method 
    # erb method
  def call(env)
    case env['REQUEST_PATH']
    when  '/'
      status = '200'
      headers = {'Content-Type' => 'text/html'}
      response(status, headers) do
        erb :index
      end
    when '/advice'
      piece_of_advice = Advice.new.generate   # random piece of advice
      status = '200'
      headers = {"Content-Type" => 'text/html'}
      response(status, headers) do
        erb :advice, message: piece_of_advice
      end 
    else
      status = '404'
      headers = {"Content-Type" => 'text/html', "Content-Length" => '61'},
      response(status, headers) do
        erb :not_found  
      end      
    end
  end
end
