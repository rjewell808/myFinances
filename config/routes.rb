Rails.application.routes.draw do
  get '/', to: 'pages#home'
  match 'transaction', to: 'pages#transaction', via: :post
end
