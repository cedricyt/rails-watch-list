class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @movies = Movie.where(id: params[:bookmark][:movie])
    @movies.each do |movie|
      bookmark = Bookmark.new(movie: movie, list: @list)
      bookmark.save
    end
    redirect_to list_path(@list)
  end
end
