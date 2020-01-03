Rails.application.routes.draw do

  devise_for :employees

  devise_scope :employee do
    authenticated :employee do
      root 'employees#profile', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :employees, only: %i[show update edit] do
    collection do
      get :profile
    end
  end

  resources :tasks do
    member do
      put :complete
      put :take
    end
  end
end
