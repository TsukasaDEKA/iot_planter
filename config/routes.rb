Rails.application.routes.draw do
  get '/' => 'home#top'

  get  'user' => 'user#top'
  get  'user/new' => 'user#new'
  post 'user/create' => 'user#create'

  get  'user/:user_id' => 'planter#top'
  get  'user/:user_name/:planter_id' => 'planter#status'
  get  'user/:user_name/:planter_id' => 'planter#status'

  get  'planter/new' => 'planter#new'
  post 'planter/create' => 'planter#create'
  get  'planter/:planter_id/setting' => 'planter#return_setting'
  post 'planter/:planter_id/setting' => 'planter#update_setting'
  post 'planter/:planter_id/status_update' => 'planter#status_update'

end
