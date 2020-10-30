class CreateScans < ActiveRecord::Migration[6.0]
  def change
    create_table :scans do |t|
      t.text :invoice_number
      t.text :transporter_name

      t.timestamps
    end
  end
end
