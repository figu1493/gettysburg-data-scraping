class TopWordsController < ApplicationController
  def home
    @top_words = TopWord.all
  end

  def index
    TopWord.four_score
    @top_words = TopWord.all
  end

  def top_100
    @top_words = TopWord.limit(100)
  end

  def show
    @top_word = TopWord.find(params[:id])
  end

  def edit
    @top_word = TopWord.find(params[:id])
  end

  def create
    @top_word = TopWord.new(params[:TopWord])

    respond_to do |format|
      if @top_word.save
        format.html { redirect_to @top_word, notice: 'TopWord was successfully created.' }
        format.json { render json: @top_word, status: :created, location: @top_word }
      else
        format.html { render action: "new" }
        format.json { render json: @top_word.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @top_word = TopWord.find(params[:id])

    respond_to do |format|
      if @top_word.update_attributes(params[:TopWord])
        format.html { redirect_to @top_word, notice: 'TopWord was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @top_word.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @top_word = TopWord.find(params[:id])
    @top_word.destroy
    redirect_to home_path
  end

  def destroy_all
    TopWord.destroy_all
    redirect_to home_path
  end
end
