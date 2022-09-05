class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    messages = Message.all.order(created_at: :asc)
    messages.to_json
  end

  post '/messages' do
    message = Message.create(body: params[:body], username: params[:username], created_at: params[:created_at], updated_at: params[:updated_at])
    message.to_json
  end

  patch '/messages/:id' do
    body = Message.find(params[:id])
    body.update(body: params[:body])
    body.to_json
  end

  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.destroy
    message.to_json
  end
end
