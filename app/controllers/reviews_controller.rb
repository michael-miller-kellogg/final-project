class ReviewsController < ApplicationController
  def list
    @reviews = Review.all

    render("review_templates/list.html.erb")
  end

  def item_reviews
    
    if Item.where("id =?", params.fetch("item_id")).first.nil?
      redirect_to("/reviews") #need to add a validation message here!!!
    else
      @item = Item.where("id = ?", params.fetch("item_id")).first
      @reviews = Review.where({ :item_id => params.fetch("item_id") })
      render("review_templates/item_reviews.html.erb")
    end
  end

  def item_review
    @item = Item.where("id = ?", params.fetch("item_id")).first
    render("review_templates/item_review.html.erb")
  end


  def details
    @review = Review.where({ :id => params.fetch("id_to_display") }).first

    render("review_templates/details.html.erb")
  end

  def blank_form
    @review = Review.new

    render("review_templates/blank_form.html.erb")
  end

  def save_new_info
    @review = Review.new

    @review.item_id = params.fetch("item_id")
    @review.user_id = current_user.id
    @review.rating = params.fetch("rating")
    @review.review = params.fetch("review")
    @review.orderagain = params.fetch("orderagain", false)
    
    if params[:photo].present?
      @review.photo = params.fetch("photo")
    else
      @review.photo = "1"
    end
    
    if @review.valid?
      @review.save

      redirect_to("/reviews", { :notice => "Review created successfully." })
    else
      render("review_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @review = Review.where({ :id => params.fetch("id_to_prefill") }).first

    render("review_templates/prefilled_form.html.erb")
  end

  def save_edits
    @review = Review.where({ :id => params.fetch("id_to_modify") }).first

    @review.item_id = params.fetch("item_id")
    @review.user_id = current_user.id
    @review.rating = params.fetch("rating")
    @review.review = params.fetch("review")
    @review.orderagain = params.fetch("orderagain", false)

    if @review.valid?
      @review.save

      redirect_to("/reviews/" + @review.id.to_s, { :notice => "Review updated successfully." })
    else
      render("review_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @review = Review.where({ :id => params.fetch("id_to_remove") }).first

    @review.destroy

    redirect_to("/reviews", { :notice => "Review deleted successfully." })
  end
end
