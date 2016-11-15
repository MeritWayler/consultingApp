class Receipt < ApplicationRecord
	belongs_to :user

	has_attached_file :factura
end
