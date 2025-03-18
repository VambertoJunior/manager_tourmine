Rails.application.routes.draw do
  devise_for :usuarios, controllers: {
    registrations: 'usuarios/registrations'
  }

  resources :torneios, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      post 'inscrever'
      get 'inscricoes'
    end
  end

  resources :usuarios, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  root 'torneios#index'
end