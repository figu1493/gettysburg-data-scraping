require 'test_helper'

class TopWordsControllerTest < ActionController::TestCase
  setup do
    @top_word = top_words(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:top_words)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create top_word" do
    assert_difference('TopWord.count') do
      post :create, top_word: {  }
    end

    assert_redirected_to top_word_path(assigns(:top_word))
  end

  test "should show top_word" do
    get :show, id: @top_word
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @top_word
    assert_response :success
  end

  test "should update top_word" do
    put :update, id: @top_word, top_word: {  }
    assert_redirected_to top_word_path(assigns(:top_word))
  end

  test "should destroy top_word" do
    assert_difference('TopWord.count', -1) do
      delete :destroy, id: @top_word
    end

    assert_redirected_to top_words_path
  end
end
