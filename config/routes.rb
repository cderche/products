Rails.application.routes.draw do
  resources :product_lines, only: [:show, :index] do
    member do
      get :publish
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
