Rails.application.routes.draw do
  get '/', to: 'pages#income'
  get '/spending/', to: 'pages#spending'
  get 'render_income', to: 'pages#render_income'
  get 'render_spending', to: 'pages#render_spending'
  get 'render_transfer', to: 'pages#render_transfer'
  match 'transaction', to: 'pages#transaction', via: :post
end
