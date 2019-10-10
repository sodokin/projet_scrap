require 'nokogiri'         
require 'open-uri'
​
def get_one_mail
    page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
    array_name = []
    array_mail = []
​
    array_1 = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
      array_1.each do |get_name|
         array_name << get_name.text
    end
​
    array_2 = page.xpath('/html/body/div/main/section[1]/div/div/div/h1')
      array_2.each do |get_mail|
         array_mail << get_mail.text       
    end
    
 zipped_array = array_mail.zip(array_name)
 array_of_hashes = []
 zipped_array.each do |element|
 array_of_hashes << {element[0] => element[1]}
end
 puts array_of_hashes
 return array_of_hashes
end
get_one_mail