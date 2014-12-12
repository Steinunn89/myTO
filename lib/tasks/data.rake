require "nokogiri"
require "open-uri"

def scrape_page(date)
  url = "http://www.blogto.com/events/?date=#{date}"

  page = Nokogiri::HTML(open(url))
  
  date = page.css(".events-overview .info")
  	.text
  	.split(",")[1..2]
  	.join(",")

  events = page.css(".events-list .events-item")
  events.map do |event|
    image = if event.css(".poster a img").empty?
      "http://schools.district279.org/ec/images/stories/EC/img/calendar%20image.jpg"
    else
      event.css(".poster a img").attr('src').value
    end

    begin
      {
    	name:        event.css(".event-name").text,
    	description: event.css(".event-summary").text,
    	address:     event.css(".event-address").text,
    	start_date:  Date.parse(date),
    	time:        event.css(".event-time").text.strip,
  	  image:       image
      }
    rescue => e
      binding.pry
    end
  end
end


namespace :data do
  desc "Load data from blogto and add to database"
  task weekly_populate: :production do

  	first_day = Date.new
  	dates = [1,2,3,4,5,6,7].map do |day|
  		(first_day + day.days).strftime("%Y-%m-%e")
  	end	
  	 

  	# dates = ["2014-12-01", "2014-12-02", "2014-12-03"]


	dates.each do |date|
		results = scrape_page(date)
		results.each do |result|
		  Event.create!(
		    name:         result[:name],
		    description:  result[:description],
		    address:      result[:address],
		    start_date:   result[:start_date],
		    time:         result[:time],
		    image:        result[:image]
		  )
		end
	end


  end
end
