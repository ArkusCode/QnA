Rails.application.routes.draw do
  root 'question#index'
  resources :questions, only: %i[index show create new] do
    resources :answers, only: %i[show create new], shallow: true
  end
end
