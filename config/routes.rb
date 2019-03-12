Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/chats', to: 'chats#index'
    # 
    # get '/chats/:id', to: 'chats#show'
    #
    # post '/chats', to: 'chats#create'
    #
    # delete '/chats/:id', to: 'chats#delete'
    #
    # put '/chats/:id', to: 'chats#update'
end
