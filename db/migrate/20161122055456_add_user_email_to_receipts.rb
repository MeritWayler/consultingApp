class AddUserEmailToReceipts < ActiveRecord::Migration[5.0]
  def change
    add_column :receipts, :user_email, :string
  end
end
