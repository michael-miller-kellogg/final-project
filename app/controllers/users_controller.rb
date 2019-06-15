class UsersController < ApplicationController
  
  def my_profile
    @reviews = Review.where("user_id=?", current_user.id)
    @favorites = Favorite.where("user_id=?", current_user.id)
    render("user_templates/my_profile")
  end
  
  
end
