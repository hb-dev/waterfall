module NewsfeedsHelper
	def datetime_helper(datetime)
		datetime = datetime.to_time
		Time.now - datetime < 1.week ? (l datetime, format: "%A, %I:%m %p") : (l datetime.to_date)
	end
end
