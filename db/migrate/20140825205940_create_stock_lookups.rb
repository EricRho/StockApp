class CreateStockLookups < ActiveRecord::Migration
  def change
    create_table :stock_lookups do |t|
      t.string :name
      t.string :symbol

      t.timestamps
    end
  end
end
