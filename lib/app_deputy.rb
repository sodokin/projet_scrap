require 'nokogiri'   
require 'open-uri'
def member_of_parliament
	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	member1 = []
	member1 = page.xpath("/html/body").text
	puts member1
		
	end
	
end