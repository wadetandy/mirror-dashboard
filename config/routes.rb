Rails.application.routes.draw do
  scope 'api' do
    resource :weather, controller: :weather, only: :show
  end

  mount_ember_app :frontend, to: "/", controller: :frontend, action: :index
end
