class AddContentAndInstallmentAmountToInstallments < ActiveRecord::Migration
  def change
    add_column :installments, :content, :string
    add_column :installments, :installment_amount, :float
  end
end
