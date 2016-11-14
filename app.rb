require 'rubygems'
require 'Twilio-ruby','4.13.0'
require 'sinatra','1.4.7'



get '/' do
erb :index
end

  account_sid = 'AC318322dd6f08156292077d626b8850db'
  auth_token = 'd380ee4c115dafb11f5938fb059db58b'
post '/send' do

  @client = Twilio::REST::Client.new(account_sid, auth_token)
  to_number = params.fetch('number').delete('.-').to_i

  @client.account.messages.create({
    :from => '+19179094316',
    :to => to_number,
    :body => 'WORKING',
  })
end
