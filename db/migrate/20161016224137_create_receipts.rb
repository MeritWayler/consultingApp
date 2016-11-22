class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
    	t.string :type
    	t.date :date
    	t.string :concept
    	t.float :subtotal
    	t.float :total
    	t.float :iva
    	t.string :xml 
      t.string :user_email
      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
