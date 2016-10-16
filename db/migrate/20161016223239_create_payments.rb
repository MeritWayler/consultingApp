class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments, :primary_key => :idPayment do |t|
     	t.date :startDate
     	t.date :endDate
     	t.string :total
     	#t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
