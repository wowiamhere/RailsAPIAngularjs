Rails.application.routes.draw do
  get '/' => 'rails_objects#index'

  resources :rails_objects
end
