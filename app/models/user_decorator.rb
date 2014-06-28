Spree::User.class_eval do
  after_create  :send_on_create_welcome_email

  protected

    def send_on_create_welcome_email
      Spree::UserMailer.welcome_email(self).deliver if not self.email.blank?
    end

end
