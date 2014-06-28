Spree::UserMailer.class_eval do
  layout 'spree/layouts/email'

  def welcome_email(user, *args)
    subject = 'Welcome to ' + Spree::Config[:site_name] + '!'
    mail(to: user.email, from: from_address, subject: subject)
  end
end
