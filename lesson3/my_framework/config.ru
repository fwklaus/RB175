# 'rackup' configuration file - to run application

# loads external file
require_relative 'app'

# run method used by config file to say what application we want to run on our server 
run App.new 
