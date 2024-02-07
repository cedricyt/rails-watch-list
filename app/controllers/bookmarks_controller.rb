class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(bookmark_params)
    # @movies = Movie.where(id: params[:bookmark][:movie])
    # @movies.each do |movie|
    #   bookmark = Bookmark.new(movie: movie, list: @list)
    #   bookmark.save
    # end
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
