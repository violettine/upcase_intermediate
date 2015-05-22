class HashtagsController < ApplicationController
  def show
    @search = Search.new(term: hashtag)
    #@hashtag = params[:id]
    #@shouts = Shout.search("##{@hashtag}")
  end

  private

  def hashtag
    "##{params[:id]}"
  end
end
