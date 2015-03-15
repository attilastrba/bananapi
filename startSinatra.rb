Choices = {
  'HAM' => 'Hamburger',
  'PIZ' => 'Pizza',
  'CUR' => 'Curry',
  'NOO' => 'Noodles',
}


require 'sinatra'


set :bind, '0.0.0.0'
set :port,80 

cmd_off = "gpio write 1 1"
cmd_on = "gpio write 1 0"


value = `#{cmd_on}`
sleep(0.5)
value = `#{cmd_off}`

get '/' do
  'Hello, voter!'
  erb :reset
end

post '/reset' do
  @title = 'Thanks for casting your vote!'
  value = `#{cmd_on}`
  sleep(0.5)
  value = `#{cmd_off}`
 redirect '/'
end

post '/on' do
  @title = 'Thanks for casting your vote!'
  value = `#{cmd_on}`
 redirect '/'
end
post '/off' do
  @title = 'Thanks for casting your vote!'
  value = `#{cmd_off}`
 redirect '/'
end
