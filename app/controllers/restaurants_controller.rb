class RestaurantsController < ApplicationController
  def list
    @q = Restaurant.ransack(params[:q])
    @restaurants = @q.result(:distinct => true).includes(:items)
    render("restaurant_templates/list.html.erb")
  end

  def save_new_info_additem
        
    duplicate=false
    Restaurant.all.each do |restaurant|
      if restaurant.place == params.fetch("place").chomp
        duplicate= true
      end
    end
    

    @restaurant = Restaurant.new
    

    @restaurant.place = params.fetch("place")
    @restaurant.website = params.fetch("website")
    @restaurant.cuisine = params.fetch("cuisine")

    if @restaurant.valid? && duplicate==false
      @restaurant.save

      redirect_to("/new_item_form", { :notice => "Restaurant created successfully." })
    else
      render("restaurant_templates/blank_form.html.erb", { :notice => "This is a duplicate" }) 
    end
  end

  def details
    @restaurant = Restaurant.where({ :id => params.fetch("id_to_display") }).first

    render("restaurant_templates/details.html.erb")
  end

  def blank_form
    @restaurant = Restaurant.new

    render("restaurant_templates/blank_form.html.erb")
  end

  def save_new_info
    
    duplicate=false
    Restaurant.all.each do |restaurant|
      if restaurant.place == params.fetch("place").chomp
        duplicate= true
      end
    end
    

    @restaurant = Restaurant.new
    

    @restaurant.place = params.fetch("place")
    @restaurant.website = params.fetch("website")
    @restaurant.cuisine = params.fetch("cuisine")

    if @restaurant.valid? && duplicate==false
      @restaurant.save

      redirect_to("/restaurants", { :notice => "Restaurant created successfully." })
    else
      render("restaurant_templates/blank_form.html.erb", { :notice => "This is a duplicate" }) 
    end
  end

  def prefilled_form
    @restaurant = Restaurant.where({ :id => params.fetch("id_to_prefill") }).first

    render("restaurant_templates/prefilled_form.html.erb")
  end

  def save_edits
    
    
    @restaurant = Restaurant.where({ :id => params.fetch("id_to_modify") }).first

    @restaurant.place = params.fetch("place")
    @restaurant.website = params.fetch("website")
    @restaurant.cuisine = params.fetch("cuisine")

    if @restaurant.valid?
      @restaurant.save

      redirect_to("/restaurants/" + @restaurant.id.to_s, { :notice => "Restaurant updated successfully." })
    else
      render("restaurant_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @restaurant = Restaurant.where({ :id => params.fetch("id_to_remove") }).first

    @restaurant.destroy

    redirect_to("/restaurants", { :notice => "Restaurant deleted successfully." })
  end
end
