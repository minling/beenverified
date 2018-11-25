Rails.application.routes.draw do
  get '/top', to: 'links#top'
  get '/*path', to: 'links#index'
  post '/*url', to: 'links#create'
end
