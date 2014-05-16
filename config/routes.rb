Spree::Core::Engine.routes.draw do
  namespace :admin do
    get 'mail_preview', :to => "mail_preview#index", as: :mail_preview
    get 'mail_preview/order/confirm/:number', :to => "mail_preview#show_order_confirm", as: :mail_preview_order_confirm
    get 'mail_preview/order/cancel/:number', :to => "mail_preview#show_order_cancel", as: :mail_preview_order_cancel
    get 'mail_preview/shipment/:number', :to => "mail_preview#show_shipment", as: :mail_preview_shipment
    get 'mail_preview/user/reset_password/:id', :to => "mail_preview#show_user_reset_password", as: :mail_preview_user_reset_password
  end
end
