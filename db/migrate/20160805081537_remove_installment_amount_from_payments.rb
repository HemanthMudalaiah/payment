class RemoveInstallmentAmountFromPayments < ActiveRecord::Migration
  def change
  	remove_column :payment_txns, :installment_amount
  end
end
