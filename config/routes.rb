Rails.application.routes.draw do
  
  get 'sessions/new'
  get 'sessions/create'
get '/authors/:author_id/books/:id/delete', to: 'books#destroy', as: 'author_book_delete'

resources :authors, only: [:index] do 
  resources :books
end

resources :books 

root 'application#hello'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'

end