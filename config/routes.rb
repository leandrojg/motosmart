Rails.application.routes.draw do
  scope '/api/v1' do
    resources :users, only: [:create, :show, :index] do
      resources :records, only: [:create], param: :user_id
    end
    
    resources :rankings, only: [] do
      collection do
        get 'actual'
        get ':year/:month', to: 'rankings#show', as: 'monthly'
      end
    end
  end
end

