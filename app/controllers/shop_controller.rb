class ShopController < ApplicationController
  def yellow
    if current_user.score != nil && current_user.score > 120
      if current_user.badge != 'yellow'
        current_user.update_attribute(:score, current_user.score - 120)
        current_user.update_attribute(:badge, "yellow")
        current_user.save
        redirect_to shop_url , flash: {notice: "done!"}
      else
        redirect_to shop_url, flash: {notice: "you already have it !"} 
      end
    else
      redirect_to shop_url, flash: {notice: "not enough score"} 
    end
  end

  def blue
    if current_user.score != nil && current_user.score > 150
      if current_user.badge != 'blue'
        current_user.update_attribute(:score, current_user.score - 150)
        current_user.update_attribute(:badge, "blue")
        current_user.save
        redirect_to shop_url , flash: {notice: "done!"}
      else
        redirect_to shop_url, flash: {notice: "you already have it !"} 
      end
    else
        redirect_to shop_url , flash: {notice: "not enough score"}
    end
  end

  def epic
    if current_user.score != nil && current_user.score > 250
      if current_user.badge != 'epic'
        current_user.update_attribute(:score, current_user.score - 250)
        current_user.update_attribute(:badge, "epic")
        current_user.save
        redirect_to shop_url , flash: {notice: "done!"}
      else
        redirect_to shop_url, flash: {notice: "you already have it !"} 
      end
    else
        redirect_to shop_url , flash: {notice: "not enough score"}
    end
  end

  def nerd
    if current_user.score != nil && current_user.score > 250
      if current_user.badge != 'nerd'
        current_user.update_attribute(:score, current_user.score - 250)
        current_user.update_attribute(:badge, "nerd")
        current_user.save
        redirect_to shop_url , flash: {notice: "done!"}
      else
        redirect_to shop_url, flash: {notice: "you already have it !"} 
      end
    else
        redirect_to shop_url , flash: {notice: "not enough score"}
    end
  end

end
