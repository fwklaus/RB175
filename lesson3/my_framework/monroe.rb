# framework to house general purpose methods that multiple applications may have in common
class Monroe
  # ERB#result returns a 100% HTML string
  def erb(filename, local = {})
    # creates a Binding object. Binds to in-scope artifacts in current context
    b = binding
    message = local[:message]
    content = File.read("views/#{filename}.erb")
    # accepts binding object and returns a string template for that code - body
    ERB.new(content).result(b)
  end

  def response(status, headers, body = '')
    # yields to block which returns value returned by call to erb - body
    body = yield if block_given?
    [status, headers, [body]]
  end
end
