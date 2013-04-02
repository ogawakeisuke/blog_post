# -*- coding: utf-8 -*-

class PostBlogsController < ApplicationController
  def index
    @stars = star_status
  end

  def post
    image = params[:images].read
    star = params[:star].to_i
    comment = params[:star]
    shop_name = params[:shop_name]
    menu_name = params[:menu_name]

    upploaded_url = Xmls::Fc2.imagepost(image)
    unless upploaded_url
      redirect_to index_path
      return 
    end

    title = "#{shop_name}に行ってまいりました"
    image_expression = self.class.helpers.image_expression(upploaded_url)
    textbody = Desc.compose_textbody(shop_name, menu_name, star, comment, image_expression)

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
