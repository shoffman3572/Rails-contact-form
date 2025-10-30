# app/models/contact.rb
class Contact < ApplicationRecord
  validates :name, :email, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validate :honeypot_empty
  private
  def honeypot_empty
    errors.add(:base, "Spam detected") if nickname.present?
  end
end
