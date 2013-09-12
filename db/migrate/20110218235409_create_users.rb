class CreateUsers < ActiveRecord::Migration
  def change
    create_table  :users do |t|
      t.string    :email, :null => false, :default => ''
      t.string    :role, :null => false, :default => ''
      t.string    :encrypted_password, :null => false, :default => ""
      t.string    :reset_password_token
      t.datetime  :reset_password_sent_at
      t.datetime  :remember_created_at
      t.integer   :sign_in_count, :default => 0, :null => false
      t.datetime  :current_sign_in_at
      t.datetime  :last_sign_in_at
      t.string    :current_sign_in_ip
      t.string    :last_sign_in_ip

      t.string    :address_line_1
      t.string    :address_line_2
      t.string    :suburb
      t.string    :state
      t.string    :postcode
      t.string    :trading_name
      t.string    :abn

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
  end
end