class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string  :name
      t.string  :email
      t.string  :phone
      t.string  :address_line_1
      t.string  :address_line_2
      t.string  :suburb
      t.string  :state
      t.string  :postcode
      t.string  :trading_name
      t.string  :abn
      t.boolean :active
      t.integer :user_id

      t.timestamps
    end
  end
end
