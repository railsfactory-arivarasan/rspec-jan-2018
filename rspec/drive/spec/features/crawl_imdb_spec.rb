require 'rails_helper'

describe "crawl a given user page", :type => :feature do
  it "should get top 10 movies of actor" do
    visit 'http://www.imdb.com/name/nm0000138/'
    find_by_id('filmoform').find_field('sort').find(:xpath, 'option[4]').select_option
    find_field('movie').click
    sleep 2
    index = 0
    content = page.all('div[class="lister-item-content"]').each_with_index do |el, index|
      h3 = el.find('h3[class="lister-item-header"]')
      rating = el.find('div[class="inline-block ratings-imdb-rating"]')
      puts "#{h3.text} - #{rating.text}"
      break if index == 9
    end
    sleep 5
  end
end