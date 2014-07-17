ZendeskEngine::Engine.routes.draw do
  resources :tickets, only: [:create]
end
