class TitleWorker
	include SuckerPunch::Job

	def perform(link)
		connection = Faraday.new(url: link)
		response = connection.get
		response.body
	end
end
