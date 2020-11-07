class Scan < ApplicationRecord
  validates :invoice_number, presence: true
end
