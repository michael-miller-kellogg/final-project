class ItemsController < ApplicationController
  def list
    @q = Item.ransack(params[:q])
    @items = @q.result(:distinct => true).includes(:reviews, :favorites)

    render("item_templates/list.html.erb")
  end
  
  def signin
    render("users/registrations/new.html.erb")
  end
  

  def details
    @item = Item.where({ :id => params.fetch("id_to_display") }).first

    render("item_templates/details.html.erb")
  end

  def blank_form
    @item = Item.new

    render("item_templates/blank_form.html.erb")
  end

  def save_new_info
    duplicate=false
    Item.all.each do |item|
      if item.dish == params.fetch("dish").chomp
        duplicate= true
      end
    end
    
    @item = Item.new
    
    @item.restaurant_id = params.fetch("restaurant_id")
    
    
    
    @item.dish = params.fetch("dish")
    @item.description = params.fetch("description")
    @item.vegetarian = params.fetch("vegetarian", false)
    @item.vegan = params.fetch("vegan", false)
    @item.glutenfree = params.fetch("glutenfree", false)
    @item.size = params.fetch("size")
    @item.price = params.fetch("price")

    if @item.valid? && duplicate==false
      @item.save

      redirect_to("/items", { :notice => "Item created successfully." })
    else
      render("item_templates/blank_form.html.erb")
    end
  end

  def save_new_info_addreview
    duplicate=false
    Item.all.each do |item|
      if item.dish == params.fetch("dish").chomp
        duplicate= true
      end
    end
    
    @item = Item.new
    
    @item.restaurant_id = params.fetch("restaurant_id")
    
    
    
    @item.dish = params.fetch("dish")
    @item.description = params.fetch("description")
    @item.vegetarian = params.fetch("vegetarian", false)
    @item.vegan = params.fetch("vegan", false)
    @item.glutenfree = params.fetch("glutenfree", false)
    @item.size = params.fetch("size")
    @item.price = params.fetch("price")

    if @item.valid? && duplicate==false
      @item.save

      redirect_to("/new_review_form", { :notice => "Item created successfully." })
    else
      render("item_templates/blank_form.html.erb")
    end
  end



  def prefilled_form
    @item = Item.where({ :id => params.fetch("id_to_prefill") }).first

    render("item_templates/prefilled_form.html.erb")
  end

  def save_edits
    @item = Item.where({ :id => params.fetch("id_to_modify") }).first

    @item.restaurant_id = params.fetch("restaurant_id")
    @item.dish = params.fetch("dish")
    @item.description = params.fetch("description")
    @item.vegetarian = params.fetch("vegetarian", false)
    @item.vegan = params.fetch("vegan", false)
    @item.glutenfree = params.fetch("glutenfree", false)
    @item.size = params.fetch("size")
    @item.price = params.fetch("price")

    if @item.valid?
      @item.save

      redirect_to("/items/" + @item.id.to_s, { :notice => "Item updated successfully." })
    else
      render("item_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @item = Item.where({ :id => params.fetch("id_to_remove") }).first

    @item.destroy

    redirect_to("/items", { :notice => "Item deleted successfully." })
  end
end
