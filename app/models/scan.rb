class Scan < ApplicationRecord
  validates :invoice_number, presence: true
  validates :transporter_name, presence: true
end
