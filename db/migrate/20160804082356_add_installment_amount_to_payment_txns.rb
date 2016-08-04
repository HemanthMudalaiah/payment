class AddInstallmentAmountToPaymentTxns < ActiveRecord::Migration
  def change
    add_column :payment_txns, :installment_amount, :float
  end
end
