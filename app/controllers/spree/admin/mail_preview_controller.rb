class Spree::Admin::MailPreviewController < Spree::Admin::BaseController
  def index
    @order_info = Spree::Order.all.last(20).collect{ |order| order.number }
    @shipment_info = Spree::Shipment.all.last(20).collect{ |shipment| shipment.number }
    @user_info = Spree::User.all.first.id
  end

  def show_order_confirm
    @order = Spree::Order.find(:first, :conditions => { :number => params[:number] })
    render 'spree/order_mailer/confirm_email', layout: 'spree/layouts/email'
  end

  def show_order_cancel
    @order = Spree::Order.find(:first, :conditions => { :number => params[:number] })
    render 'spree/order_mailer/cancel_email', layout: 'spree/layouts/email'
  end

  def show_shipment
    @shipment = Spree::Shipment.find(:first, :conditions => { :number => params[:number] })
    render 'spree/shipment_mailer/shipped_email', layout: 'spree/layouts/email'
  end

  def show_user_reset_password
    @user = Spree::User.find_by_id(params[:id])
    @edit_password_reset_url = 'https://this-is-a-fake-url-but-would-be-real'
    render 'spree/user_mailer/reset_password_instructions', layout: 'spree/layouts/email'
  end

  def show_welcome_email
    @user = Spree::User.find_by_id(params[:id])
    render 'spree/user_mailer/welcome_email', layout: 'spree/layouts/email'
  end
end
