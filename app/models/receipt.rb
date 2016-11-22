class Receipt < ApplicationRecord
	belongs_to :user, optional: true
	has_attached_file :factura
end
