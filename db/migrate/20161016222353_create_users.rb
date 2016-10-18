class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :lastName
    	t.string :phone
    	t.string :accountState
    	t.boolean :admin 
    	t.string :rfc


      t.timestamps
    end
  end
end
