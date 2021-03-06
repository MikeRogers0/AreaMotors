Rails.application.routes.draw do
  resources :customers, only: [:index, :show] do
    member do
      resources :notes, controller: :customer_notes, only: [:create]
    end
  end

  resources :enquiries, only: [:index, :show, :edit, :update] do
    collection do
      post :fetch_new
    end

    member do
      patch :state_done
    end
  end

  root to: redirect('/enquiries')
end
