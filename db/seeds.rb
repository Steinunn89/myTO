require "pry"
require "nokogiri"
require "open-uri"
require "date"

first_date = "2014-12-19"

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

results = scrape_page(first_date)

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


Category.create!([{
  name: 'Concerts'
}])

Category.create!([{
  name: 'Festivals'
}])

Category.create!([{
  name: 'Comedy'
}])

Category.create!([{
  name: 'Family'
}])

Category.create!([{
  name: 'Nightlife'
}])

Category.create!([{
  name: 'Sports'
}])

Category.create!([{
  name: 'Performing Arts'
}])