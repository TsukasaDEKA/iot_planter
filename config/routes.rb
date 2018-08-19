Rails.application.routes.draw do
  get 'chart_sample/index'
  get '/' => 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'user' => 'user#top'
  get 'user/new' => 'user#new'
  post 'user/create' => 'user#create'

  get 'user/:user_id' => 'planter#top'
  get 'user/:user_name/:planter_id' => 'planter#status'
  post 'planter/:planter_id' => 'planter#update'

  get 'planter/new' => 'planter#new'
  post 'planter/create' => 'planter#create'

end
