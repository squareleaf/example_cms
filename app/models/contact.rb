class Contact < ApplicationRecord
  has_many :phone_numbers

  accepts_nested_attributes_for :phone_numbers

  validates :name, presence: true
  validates :email, uniqueness: {scope: :name}, allow_blank: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def avatar
    clean_email = email.strip.downcase
    Digest::MD5.hexdigest(clean_email)
  end
end
