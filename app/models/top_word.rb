class TopWord < ActiveRecord::Base
  attr_accessible :count, :word

  validates :word, uniqueness: true

  def self.four_score
  	require 'open-uri'

		url = "http://rmc.library.cornell.edu/gettysburg/good_cause/transcript.htm"
		doc = Nokogiri::HTML(open(url))

		four_score = doc.at_css("blockquote blockquote p").text 

		array = four_score.split(" ")
		nested_hash = array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
		sorted_hash = nested_hash.sort_by { |key, value| value }
		sorted_hash.reverse!
		
		sorted_hash.each do |key, value|
			puts "#{key}: #{value}"
			rake_data = TopWord.new(word: key, count: value)
			rake_data.save
		end
  end
end
