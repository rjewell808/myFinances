Rails.application.routes.draw do
  get '/', to: 'pages#income'
  get '/spendings/', to: 'pages#spending'
  match 'transaction', to: 'pages#transaction', via: :post
end
