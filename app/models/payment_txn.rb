class PaymentTxn < ActiveRecord::Base
	belongs_to :user
	has_many :installments, dependent: :destroy

	validates :total_amount, :presence => true, :numericality => true
	validates :discount, :presence => true, :numericality => true
	validate :discount_cant_be_more_than_total_amount

	accepts_nested_attributes_for :installments, :allow_destroy => true

	PAYMENTTXN_STATES = [
	  NEW = "New",
	  INPROGRESS = "Inprogress",
	  PAID = 'Paid'
	]

	before_create :set_defaults
	after_create :set_installments

	def discount_cant_be_more_than_total_amount
	  errors.add(:discount, "can't be more than total amount.") if discount > total_amount
	end

	def set_defaults
		self.status = NEW
		self.transaction_date = Time.zone.today
		self.remaining_amount = total_amount - discount
		self.amount_paid = 0
	end

	def set_installments
		unless self.installments.present?
			self.installments.create(:scheduled_date => Time.zone.today, :status => Installment::SCHEDULED) 	
		end 
	end
end

