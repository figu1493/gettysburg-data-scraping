desc "Fetch Word and count of TopWords"
task :four_score => :environment do

	require 'open-uri'

	url = "http://rmc.library.cornell.edu/gettysburg/good_cause/transcript.htm"
	doc = Nokogiri::HTML(open(url))

	four_score = doc.at_css("blockquote blockquote p").text 

	# There are 155 Unique words in the Gettysburg Address
	# This function splits the text and limits the Data returned
	# To the top 100 unique word results 
	def top_100_words(x)
		array = x.split(" ")
		nested_hash = array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
		sorted_hash = nested_hash.sort_by { |key, value| value }
		sorted_hash.reverse!
		
		sorted_hash.each do |key, value|
			rake_data = TopWord.new(word: key, count: value)
			rake_data.save
		end

		TopWord.limit(100).each { |x| p x }
	end

	top_100_words(four_score)
end