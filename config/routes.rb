Rails.application.routes.draw do

    devise_for :admins
    scope module: :public do
        root to: 'homes#top'
        get '/about' => 'homes#about'
        resources :items, only:[:index, :show]
        resources :customers, only:[:show, :edit, :update]
        get '/customers/unsubscribe' => 'customers#unsubscribe'
        patch '/customers/withdraw' => 'customers#withdraw'
        resources :cart_items, only:[:index, :update, :destroy, :create]
        delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
        resources :orders, only:[:new, :create, :index, :show]
        post '/orders/comfirm' => 'orders#comfirm'
        get '/orders/complete' => 'orders#complete'
        resources :addresses, only:[:index, :edit, :create, :update, :destroy]
        devise_for :customers, controllers: {
            sessions: 'public/sessions',
            registrations: 'public/registrations'
        }
    end


    # namespace :admin do
    #     get '/' => 'homes#top'
    #     resources :items, only:[:index, :new, :create, :show, :edit, :update]
    #     resources :genres, only:[:index, :create, :edit, :update]
    #     resources :customers, only:[:index, :show, :edit, :update]
    #     resources :orders, only:[:show, :update]
    #     patch '/admin/orders/order_details/:id' => 'admin/order_details#update'
    # end

end
