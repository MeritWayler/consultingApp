class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts, :primary_key => :idReceipt do |t|
    	t.string :type
    	t.date :date
    	t.string :concept
    	t.float :subtotal
    	t.float :total
    	t.float :iva
    	t.string :xml 
      t.timestamps
    end
  end
end
