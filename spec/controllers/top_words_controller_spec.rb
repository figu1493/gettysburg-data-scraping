require 'spec_helper'

describe TopWordsController do
	
	context "#home" do
		it "should fetch all TopWords in the database and render root_path" do
			word = FactoryGirl.create :top_word, word: "Unique"

			get :home

			TopWord.all.count.should == 1
			assigns[:top_words].last.word.should == 'Unique'
			response.should render_template root_path
		end
	end

	context "#store_data" do
		it "should scrape and store the data in the database" do
			get :store_data

			TopWord.last.id.should == 155
			TopWord.all.count.should == 155
			response.should render_template store_data_path
		end
	end

	context "#raw_data" do
		it "should render the Gettysburg address raw text" do
			get :raw_data

			assigns[:top_words].split(" ").first.should == "\"Fourscore"
			assigns[:top_words].split(" ").last.should == "earth.\""
			response.should render_template raw_data_path
		end
	end

	context "#top_100" do
		it "should limit results to the top 100 responses" do
			200.times { |x| FactoryGirl.create :top_word, word: "word #{x}" }
		
			get :top_100 

			assigns[:top_words].count.should == 100
			assigns[:top_words].last.word.should == "word 99"
			response.should render_template top_100_path
		end
	end

	context "#show" do
		it "should show Word that is found by id params" do
			word = FactoryGirl.create :top_word	

			get :show, id: word.id

			response.should be_success
			response.should render_template('show')
		end
	end

	context "#edit" do
		it "should find Word by id params" do
			word = FactoryGirl.create :top_word

			get :edit, id: word.id

			response.should be_success
			response.should render_template('edit')
		end
	end

	context "#create" do
		it "should create a new TopWord object" do
			post :create, TopWord: { word: "Awesome", count: 100}

			TopWord.all.count.should == 1
			TopWord.last.word.should == "Awesome"
		end

		it "should fail to create a new TopWord object" do
			TopWord.any_instance.stub(:save).and_return(false)

			post :create, TopWord: { word: "this", count: 1 }

			TopWord.all.count.should == 0
		end
	end

	context "#update" do
		it "should update TopWord attributes" do
			word = FactoryGirl.create :top_word
		
			post :update, id: word.id, TopWord: { word: "Le-French", count: 15 }

			TopWord.last.reload.word.should == "Le-French"
		end

		it "should fail to update TopWord attributes and render edit" do
			word = FactoryGirl.create :top_word
 
			TopWord.any_instance.stub(:update_attributes).and_return(false)
		
			post :update, id: word.id 

			response.should render_template('edit')
		end
	end

	context "#destroy" do
		it "should destroy only the TopWord object that is found by the id params" do
			word_1 = FactoryGirl.create :top_word, word: "word_1"
			word_2 = FactoryGirl.create :top_word, word: "word_2"

			post :destroy, id: word_1.id

			TopWord.all.count.should == 1
			TopWord.last.word.should == "word_2"
			response.should redirect_to root_path
		end
	end
	context "#destroy_all" do
		it "should destroy all of the TopWord objects stored in the database" do
			200.times { |x| FactoryGirl.create :top_word, word: "word #{x}" }

			put :destroy_all

			TopWord.all.count.should == 0
			response.should redirect_to root_path
		end
	end
end