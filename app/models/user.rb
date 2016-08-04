class User < ActiveRecord::Base
	has_many :payment_txns, dependent: :destroy

	validates :name, :presence => true
	validates :email_id, :presence => true, :uniqueness => true
	validates_format_of :email_id, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

	accepts_nested_attributes_for :payment_txns, :allow_destroy => true

	def in_progress_payments
		payment_txns.where('status in (?)',[PaymentTxn::NEW,PaymentTxn::INPROGRESS])
	end

	def completed_payments		
		payment_txns.where('status = ?',PaymentTxn::PAID)		
	end
end
