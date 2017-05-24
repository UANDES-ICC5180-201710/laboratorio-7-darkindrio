Rails.application.routes.draw do
  devise_for :people, path: 'auth'
  devise_scope :person do
    get 'auth', to: 'devise/registrations#new'
  end
  authenticate :person do
    resources :courses do
      resources :enrollments
      resources :assignments do
        resources :grades
      end
      get 'students', to: 'courses#students', on: :member
    end
    resources :people

    root to: 'courses#index'
  end
  post "/add_people_and_course" => "people#createAndAdd"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
