FourScore::Application.routes.draw do
  devise_for :users

  resources :top_words

  root to: 'top_words#home'

  match '/store_data',   to: 'top_words#store_data'
  match '/destroy',      to: 'top_words#destroy_all'
  match '/top_100',      to: 'top_words#top_100'
  match '/raw_data',     to: 'top_words#raw_data'
  
end
