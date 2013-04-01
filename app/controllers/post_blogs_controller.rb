class PostBlogsController < ApplicationController
  def index
    @stars = star_status
  end

  def post
    image = params[:images]
    star = params[:star]

    upploaded_url = Xmls::Fc2.imagepost(image)
    unless upploaded_url
      redirect_to :index
      return 
    end

  title = "#{star}つ星です"
  textbody = "#{upploaded_url}, #{star}, ごちそうさま"

   blogpost = Xmls::Fc2.blogpost(title, textbody)
    unless blogpost
      redirect_to :index
      return 
    end

  end


  private

  def star_status
    [1, 2, 3, 4, 5]
  end
end
