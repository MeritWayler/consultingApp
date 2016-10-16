class User < ApplicationRecord
	has_many :payments
	has_many :receipts
end
