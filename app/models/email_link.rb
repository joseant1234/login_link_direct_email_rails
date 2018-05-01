class EmailLink < ApplicationRecord
  belongs_to :user
  after_create :send_mail

  def self.generate(email)
  	user = User.find_by(email: email)
  	return nil if !user

  	# Date.today envia las 12 del dia del inicio del dia
  	create(user: user, expires_at: DateTime.now + 12.hours, token: generate_token)
  end

  def self.generate_token
  	Devise.friendly_token.first(16)
  end

  private
  def send_mail
  	EmailLinkMailer.sign_in_mail(self).deliver_now
  end
end
