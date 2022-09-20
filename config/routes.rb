Rails.application.routes.draw do
  get 'bulletin' => 'posts#index'
  get 'bulletin/:id' => 'posts#show'
  post 'posts'=> 'posts#create'
  
  get '/profile/:id' => 'users#show'
  post '/users/search' => 'users#search'
end
