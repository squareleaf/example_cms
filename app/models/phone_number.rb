class PhoneNumber < ApplicationRecord
  belongs_to :contact

  validates_format_of :phone, with: /(\d{3}-)?\d{3}-\d{4}/

  enum type: [:home, :work, :mobile, :fax]

  scope :primary, -> { where(primary: true) }
end
