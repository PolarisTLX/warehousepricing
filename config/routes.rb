Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :customers do
        get '/total_cost/:num_items' => 'customers#calculate_cost'
      end
    end
  end
end
