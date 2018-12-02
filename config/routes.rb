Rails.application.routes.draw do
  get '/top', to: 'links#index'
  get '/*path', to: 'links#show'
  post '/*url', to: 'links#create'
end
