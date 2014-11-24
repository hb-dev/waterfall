module StylesheetsHelper
	
	def check_value(property, value)
		"#{property}: #{value};" unless value.blank?
	end

end
