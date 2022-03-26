Rails.application.routes.draw do
  root 'app_interface#home'
  get '/signup', to: 'users#new'
  post '/categories',   to: 'categories#create'
  post '/brands',  to: 'brands#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :allotments do
    member do
      get 'deallot'
    end
  end

  resources :brands
  resources :categories

  resources :issues do
    member do
      get 'solveissue', to: 'issues#solve_issue'
      patch 'markassolved', to: 'issues#mark_as_solved'
    end
  end

  resources :items do
    member do
      get 'allotments'
      get 'managestock', to: 'items#manage_item_stock'
      patch 'updatestock', to: 'items#update_stock'
    end
  end

  resources :users do
    member do
      get 'currentallotments', to: 'users#current_allotments'
      get 'changepassword', to: 'users#change_password'
      patch 'updatepassword', to: 'users#update_password'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
