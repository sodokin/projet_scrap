require 'nokogiri'
require 'open-uri'
require 'pry'
def crypto_scrapper
    page = Nokogiri::HTML(open("https://coinmarketcap.com"))
    array_name = []
    array_price = []
#//*[@id="id-bitcoin"]/td[2]/a
    array_1 = page.xpath('//td/a[@class = "currency-name-container link-secondary"]')
      array_1.each do |crypto_name|
         array_name << crypto_name.text
    end
#//*[@id="id-bitcoin"]/td[3]/a
    array_2 = page.xpath('//td/a[@class = "price"]')
      array_2.each do |crypto_price|
         array_price << crypto_price.text       
    end
    
 zipped_array = array_name.zip(array_price)
 array_of_hashes = []
 zipped_array.each do |element|
 array_of_hashes << {element[0] => element[1]}
end
 puts array_of_hashes
 return array_of_hashes
end
crypto_scrapper