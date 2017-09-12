class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: {scope: :name}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
