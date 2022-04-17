Rails.application.routes.draw do

  resources :quizzes do
    resources :questions
  end

  resources :attempts do
    resources :answers
  end

  match 'public_quizzes', to: "public_quizzes#index", via: [:get]

  get 'quizzes/index'
  get 'quizzes/show'
  get 'quizzes/new'
  get 'quizzes/edit'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
end
