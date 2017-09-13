class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: {scope: :name}, allow_blank: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_format_of :phone, with: /(\d{3}-)?\d{3}-\d{4}/

  def avatar
    clean_email = email.strip.downcase
    Digest::MD5.hexdigest(clean_email)
  end
end
