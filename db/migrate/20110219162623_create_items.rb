class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text    :description
      t.decimal :unit_cost, :precision => 11, :scale => 2 # Big numbers with just two decimal places
      t.decimal :quantity, :precision => 6, :scale => 2
      t.decimal :discount, :precision => 3, :scale => 2 # 1.0, 0.5, etc.
      t.integer :invoice_id

      t.timestamps
    end
  end
end
