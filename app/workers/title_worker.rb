class TitleWorker
  include Sidekiq::Worker  

  def perform(given_url)
		connection = Faraday.new(url: given_url)
		response   = connection.get
		response.body
    page  = Nokogiri::HTML(response.body)
		title = page.css("title").first.child.text
		#title = page.css("title")[0].text 
		link  = Link.find_by(given_url: given_url)
		link.update_attributes(title: title)
  end
end
