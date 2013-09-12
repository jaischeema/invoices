class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.text    :notes
      t.text    :terms
      t.string  :status
      t.integer :client_id

      t.timestamps
    end
  end
end
