class Installment < ActiveRecord::Base
	belongs_to :payment_txn

	validates :scheduled_date, :presence => true

	INSTALLMENT_STATES = [
	  SCHEDULED = "Scheduled",
	  OVERDUE = "Overdue",
	  PAID = 'Paid'
	]

	after_create :update_payment_txn_record
	after_update :update_payment_txn_status

	def update_payment_txn_record
		payment_txn = self.payment_txn
		payment_txn.no_of_installments = payment_txn.installments.count
		payment_txn.save
	end

	def update_payment_txn_status
		payment_txn = self.payment_txn
		installment_states = payment_txn.installments.collect(&:status).uniq
		if installment_states.count == 1 && installment_states[0] == PAID
			payment_txn.status = PaymentTxn::PAID
		elsif installment_states.count > 1
			payment_txn.status = PaymentTxn::INPROGRESS
		end
		payment_txn.amount_paid = payment_txn.installments.where('status = ?', PAID).collect(&:installment_amount).sum
		payment_txn.remaining_amount = payment_txn.total_amount - payment_txn.discount - payment_txn.amount_paid
		payment_txn.save
	end

	def is_overdue?
		scheduled_date < Time.zone.today
	end

	def paid?
		status == Installment::PAID
	end
end
