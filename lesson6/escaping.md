## Escapes certain characters that will render the HTML so the browswer doesn't interpret it as code

```ruby
>> require "rack"
=> true
>> Rack::Utils.escape_html "test"
=> "test"
>> Rack::Utils.escape_html %{<script>alert("This code was injected!");</script>Pizza}
=> "&lt;script&gt;alert(&quot;This code was injected!&quot;);&lt;&#x2F;script&gt;Pizza"
```

### The method is available anywhere in a Sinatra application, but we can create useful helper methods for it, as well

helpers do
  def h(content)
    Rack::Utils.escape_html(content)
  end
end

### ...Which can be used in a view template

<h3><%=h todo[:name] %></h3>


## Can enable Sinatra to automatically escape all user output
### This will escape all the code in our site
```ruby
configure do
  set :erb, :escape_html => true
end
```
### We need to replace `<%=` with `<%==` where we want to disable auto-escaping
