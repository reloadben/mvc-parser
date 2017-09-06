require 'nokogiri'
require 'open-uri'
require 'net/https'

res = ''

# Fetch and parse HTML document
doc = Nokogiri::HTML(open('https://www.avito.ru/ussuriysk/bytovaya_elektronika?p=1',  :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

doc.css('h3.item-description-title a').each do |link|
  link = 'https://www.avito.ru' + link.attributes["href"].value
  res += link
end

File.open('result.txt', 'w') { |file| file.write(res) }



