Rails.application.routes.draw do
  get '/', to: 'pages#income'
  get '/spendings/', to: 'pages#spending'
  get '/transfers/', to: 'pages#transfers'
  get 'render_income', to: 'pages#render_income'
  get 'render_spending', to: 'pages#render_spending'
  get 'render_transfer', to: 'pages#render_transfer'
  match 'transaction', to: 'pages#transaction', via: :post
  match 'transaction/:id', to: 'pages#del_transaction', via: :delete
  match 'transfer/:id', to: 'pages#del_transfer', via: :delete
end
