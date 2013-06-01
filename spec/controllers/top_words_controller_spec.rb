require 'spec_helper'

describe TopWordsController do
	
	context "#home" do
		it "Home" do
			get :home

			TopWord.all.count.should == 0
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
			pending
		end
	end

	context "#top_100" do
		it "test_here" do
			pending
		end
	end

	

	context "#show" do
		it "test_here" do
			pending
		end
	end

	context "#edit" do
		it "test_here" do
			pending
		end
	end

	context "#create" do
		it "test_here" do
			pending
		end
	end

	context "#update" do
		it "test_here" do
			pending
		end
	end

	context "#destroy" do
		it "test_here" do
			pending
		end
	end
	context "#destroy_all" do
		it "test_here" do
			pending
		end
	end
end