class AddDetailsToReceipts < ActiveRecord::Migration[5.0]
  def change
    add_column :receipts, :emisor, :string
    add_column :receipts, :rfcEmisor, :string
    add_column :receipts, :receptor, :string
    add_column :receipts, :rfcReceptor, :string
  end
end
