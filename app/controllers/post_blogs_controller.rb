# -*- coding: utf-8 -*-

class PostBlogsController < ApplicationController
  def index
    @stars = star_status
  end

  def post
    image = params[:images].read
    star = params[:star]

    upploaded_url = Xmls::Fc2.imagepost(image)
    unless upploaded_url
      redirect_to index_path
      return 
    end

    title = "#{star}つ星です"
    image_expression = self.class.helpers.image_expression(upploaded_url)
    textbody = "#{image_expression}, #{star}, ごちそうさま"

    blogpost = Xmls::Fc2.blogpost(title, textbody)
    unless blogpost
      redirect_to index_path
      return 
    end

  end


  private

  def star_status
    [1, 2, 3, 4, 5]
  end
end
