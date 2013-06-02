require 'spec_helper'

describe TopWordsController do
	
	context "#home" do
		it "should fetch all TopWords in the database" do
			word = FactoryGirl.create :top_word, word: "Unique"

			get :home

			TopWord.all.count.should == 1
			TopWord.last.word.should == "Unique"
		end
	end

	context "#store_data" do
		it "store_data should scrape and store the data in the database" do
			get :store_data

			TopWord.last.id.should == 155
			TopWord.all.count.should == 155
		end
	end

	context "#raw_data" do
		it "test_here" do
			get :raw_data

			print response.body
			print response
		end
	end

	context "#top_100" do
		it "should limit results to the top 100 responses" do
			200.times { |x| FactoryGirl.create :top_word, word: "word #{x}" }
			
			p response.body
			p response
		end
	end

	context "#show" do
		it "test_here" do
			pending
			get :show
		end
	end

	context "#edit" do
		it "test_here" do
			pending
			get :edit
		end
	end

	context "#create" do
		it "should creat a new TopWord object" do
			post :create

			TopWord.all.count.should == 1
		end
	end

	context "#update" do
		it "test_here" do
			pending
			get :update
		end
	end

	context "#destroy" do
		it "should destroy only the TopWord object that is found by the id params" do
			word_1 = FactoryGirl.create :top_word, word: "word_1"
			word_2 = FactoryGirl.create :top_word, word: "word_2"

			post :destroy, id: word_1.id

			TopWord.all.count.should == 1
			TopWord.last.word.should == "word_2"
		end
	end
	context "#destroy_all" do
		it "should destroy all of the TopWord objects stored in the database" do
			200.times { |x| FactoryGirl.create :top_word, word: "word #{x}" }

			put :destroy_all

			TopWord.all.count.should == 0
		end
	end
end