Rails.application.routes.draw do
  #api definition
  namespace :api, defaults: {format: :json},constraints: {subdomain: 'api'}, path: '/' do #telling that the routes are for json notation
    scope module: :v1,
                   constraints: ApiConstraints.new(version: 1,default: true) do
    
    end
  end

end
