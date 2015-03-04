Rails.application.routes.draw do

  scope '/(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    # Static pages and routes
    match '/contacts', to: 'static_pages#contacts', as: :contacts, via: :get
    match '/riga', to: 'static_pages#riga', as: :riga, via: :get
    root 'static_pages#index'
  end

  root to: redirect("/#{I18n.default_locale}", status: 302),
       as: :redirected_root

end
