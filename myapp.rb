# myapp.rb
require 'sinatra'
set :bind,'192.168.178.132'
get '/' do
  'Hello world!'
end
