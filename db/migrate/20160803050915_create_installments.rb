class CreateInstallments < ActiveRecord::Migration
  def change
    create_table :installments do |t|
      t.integer :payment_txn_id
      t.date :scheduled_date
      t.string :status

      t.timestamps
    end
  end
end
