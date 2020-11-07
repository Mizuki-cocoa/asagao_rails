Rails.application.routes.draw do
    root "top#index"
    get "about" => "top#about", as: "about"
    get "bad_request" => "top#bad_request"
    get "forbidden" => "top#forbidden"
    get "internal_server_error" => "top#internal_server_error"
    #get "/entries/voted" => "/entries/1/voted"

    1.upto(19) do |n|
        get "lesson/step#{n}(/:name)" => "lesson#step#{n}"
    end


    resources :members do
        get "search", on: :collection
        resources :entries, only: [:index]
        resources :duties, only: [:index]
    end
    resources :entries do
        patch "like", "unlike", on: :member
        get "voted",on: :collection
        
        member do
            get 'voted'
        end

    end
    resource :session, only: [:create, :destroy]
    resource :account, only: [:show, :edit, :update]
    resource :password, only: [:show, :edit, :update]
    resources :entries
    resources :duties, only: [:index]
end
