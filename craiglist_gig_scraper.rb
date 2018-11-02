require 'open-uri'
require 'nokogiri'

cities = ['newyork', 'dallas']
serch_terms = ['python', 'ruby']

cities.each do |city|
  serch_terms.each do |serch_term|

    url = "https://newyork.craigslist.org/search/cpg?query=developer&is_paid=all"

    document = open(url)
    content = document.read
    persed_content = Nokogiri::HTML(content)

    puts '======================================='
    puts '-                                     -'
    puts "-      #{city} - #{serch_term}        -"
    puts '-                                     -'
    puts '======================================='

    persed_content.css('.content').css('.result-row').each do |row|
      title        = row.css('.hdrlnk').inner_text
      neighborhood = row.css('.result-hood').inner_text
      link         = row.css('.hdrlnk').first.attributes["href"].value
      posted_at    = row.css('time').first.attributes["datetime"].value

      puts "#{title} #{neighborhood}"
      puts "Link: #{link}"
      puts "posted_at #{posted_at}"
      puts '------------------------------'
    end

  end
end
