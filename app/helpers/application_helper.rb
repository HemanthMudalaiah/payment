module ApplicationHelper
	def installment_options
		options = {'Select' => ''}
		Installment::INSTALLMENT_STATES.each { |wait_list_state| options = options.merge({wait_list_state => wait_list_state}) }    
		options
	end
end
