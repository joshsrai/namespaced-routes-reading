Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # get '/stats', to: 'stats#index' 
  # added stats#index
  # but then was moved to admin/stats
  # so that only the admin can see the stats

  # get '/admin/stats', to: 'stats#index'
  # the above route was refactored in favor of using scope,
  # so that DRY could be implemented
  
  # scope '/admin' do
  #   resources :stats, only: [:index]
  # end 
  # because the index stats view file was moved into
  # app/views/admin/stats/index.html.erb
  # and the stats_contoller was moved into
  # app/controllers/admin/stats_controller.rb
  # scope needed to be update to show the change

  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end 
    # When we want to route with a module
    # and use that module's name as the URL prefix,
    # we can use the namespace method instead of
    # scope, module.

  namespace :admin do
    resources :stats, only: [:index]
  end 

  root 'posts#index'

  

end
