Rails.application.routes.draw do
  get '/',to: 'contacts#new'
  resources :contacts
end
