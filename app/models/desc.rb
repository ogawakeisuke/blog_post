class Desc < ActiveRecord::Base
  attr_accessible :description, :phase_state, :star_state

  module Phase
    FIRST = 1
    FRIEND = 2
    PICTURE = 3
    LAST = 4
  end

  def self.star_hashes
    {
      :first => 1,
      :second => 2,
      :third => 3,
      :fourth => 4,
      :fifth => 5,
      :empty => nil
    }
  end

  def self.phase_hashes
    {
      :first => Phase::FIRST,
      :friend => Phase::FRIEND,
      :picture => Phase::PICTURE,
      :last => Phase::LAST,
      :empty => nil
    }
  end
  #=======
  #TODO メソッドの動的定義で解決出来る問題

  def set_value_to_menu(value)
    self.description.gsub!(/#menu/, value)
  end

  def set_value_to_shop(value)
    self.description.gsub!(/#shop/, value)
  end

  #=======

  #TODO もっと細かくリファクタリング
  def self.compose_textbody(shop_name, menu_name, star, comment, image_tags)
    #star使ってない
    first = self.where(:phase_state => Phase::FIRST).sample
    friend = self.where(:phase_state => Phase::FRIEND).sample
    picture = self.where(:phase_state => Phase::PICTURE).sample
    last = self.where(:phase_state => Phase::LAST).sample

    first.set_value_to_menu(menu_name)
    first.set_value_to_shop(shop_name)

    return "#{first.description} #{friend.description} #{picture.description} #{image_tags} <br> #{comment} #{last.description}"
  end

end
