Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :trees

  # resources :trees do
  #   resources :adoptions, only: [:create, :show, :new]
  # end
  # resources :adoptions, only: :destroy

  resources :trees do
    resources :adoptions, only: :create
  end
  resources :adoptions, only: [:show, :update, :destroy]

  # resources :user do
  #   resources :adoptions, only: [:show, :update, :destroy]
  # end



  # resources :users do
  #   resources :trees, only: [:show, :index, :edit, :destroy]
  # end


  # resources :users do
  #   resources :reviews, only: [:create, :update, :destroy, :show]
  # end

  # resources :users do
  #   resources :adoptions, only: [:create, :new, :show]
  # end


end

# resources :trees, only: [:index, :new, :create, :show ]

# resources :users do
#   resources :trees, only: [:show, :index, :edit, :destroy]
# end

# resources :trees, only: [:show, :index]

# resources :users do
#   resources :reviews, only: [:create, :update, :destroy]
# end

# resources :users do
#   resources :adoptions, only: [:create, :new, :show]
# end
