require 'open-uri'
require 'nokogiri'

class TopWord < ActiveRecord::Base
  attr_accessible :count, :word, :tampa_tid, :tampa_mid

  validates :word, uniqueness: true
  validates :tampa_tid, length: { :in => 1..3 }
  validates :tampa_mid, length: { :in => 1..12 }
  validates :tampa_tid, format: { :with => /\d+/}
  validates :tampa_mid, format: { :with => /\d+/}

  def self.raw_data
		url = "http://rmc.library.cornell.edu/gettysburg/good_cause/transcript.htm"
		doc = Nokogiri::HTML(open(url))

		@four_score = doc.at_css("blockquote blockquote p").text 
	end

  def self.four_score
		url = "http://rmc.library.cornell.edu/gettysburg/good_cause/transcript.htm"
		doc = Nokogiri::HTML(open(url))

		four_score = doc.at_css("blockquote blockquote p").text 

		array = four_score.split(" ")
		nested_hash = array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
		sorted_hash = nested_hash.sort_by { |key, value| value }
		sorted_hash.reverse!
		
		sorted_hash.each do |key, value|
			rake_data = TopWord.new(word: key, count: value)
			rake_data.save
		end
  end
end
