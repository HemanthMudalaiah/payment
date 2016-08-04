class CreatePaymentTxns < ActiveRecord::Migration
  def change
    create_table :payment_txns do |t|
      t.integer :user_id
      t.float :total_amount
      t.string :status
      t.float :discount
      t.date :transaction_date
      t.float :remaining_amount
      t.float :amount_paid
      t.integer :no_of_installments

      t.timestamps
    end
  end
end
