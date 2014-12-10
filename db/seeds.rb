require "pry"
require "nokogiri"
require "open-uri"
require "date"

first_date = "2014-12-9"

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
    	name: event.css(".event-name").text,
    	description: event.css(".event-summary").text,
    	address: event.css(".event-address").text,
    	start_date: Date.parse(date),
    	time: event.css(".event-time").text.strip,
  	  image: image
      }
    rescue => e
      binding.pry
    end
  end
end

results = scrape_page(first_date)

results.each do |result| 
  @event = Event.new
  @event.name = result[:name]
  @event.description = result[:description] 
  @event.address =result[:address]
  @event.start_date = result[:start_date]  
  @event.time = result[:time]  
  @event.image = result[:image]
  @event.save
end

binding.pry


Category.create!([{
  name: 'Art'
}])

Category.create!([{
  name: 'Food'
}])

Category.create!([{
  name: 'Games'
}])

Category.create!([{
  name: 'Film/Video'
}])

Category.create!([{
  name: 'Music'
}])

Category.create!([{
  name: 'Festival'
}])

Category.create!([{
  name: 'Concert'
}])