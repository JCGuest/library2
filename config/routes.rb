Rails.application.routes.draw do
resources :authors, only: [:index] do 
  resources :books
end

resources :books 

end