Rails.application.routes.draw do
  # Routes for the Feedback resource:

  # CREATE
  match("/new_feedback_form", { :controller => "feedbacks", :action => "blank_form", :via => "get" })
  match("/insert_feedback_record", { :controller => "feedbacks", :action => "save_new_info", :via => "post" })

  # READ
  match("/feedbacks", { :controller => "feedbacks", :action => "list", :via => "get" })
  match("/feedbacks/:id_to_display", { :controller => "feedbacks", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_feedback_form/:id_to_prefill", { :controller => "feedbacks", :action => "prefilled_form", :via => "get" })
  match("/update_feedback_record/:id_to_modify", { :controller => "feedbacks", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_feedback/:id_to_remove", { :controller => "feedbacks", :action => "remove_row", :via => "get" })

  #------------------------------

  #LANDING PAGE route
  
  match("/", { :controller => "restaurants", :action => "list", :via => "get" })
  
  
  
  #compiled item reviews
  match("/item_reviews/:item_id", { :controller => "reviews", :action => "item_reviews", :via => "get" })
  
  # Routes for the Favorite resource:

  # CREATE
  match("/new_favorite_form", { :controller => "favorites", :action => "blank_form", :via => "get" })
  match("/insert_favorite_record", { :controller => "favorites", :action => "save_new_info", :via => "post" })

  # READ
  match("/favorites", { :controller => "favorites", :action => "list", :via => "get" })
  match("/favorites/:id_to_display", { :controller => "favorites", :action => "details", :via => "get" })

  match("/user_favorites", { :controller => "favorites", :action => "user_favorites", :via => "get" })



  # UPDATE
  match("/existing_favorite_form/:id_to_prefill", { :controller => "favorites", :action => "prefilled_form", :via => "get" })
  match("/update_favorite_record/:id_to_modify", { :controller => "favorites", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_favorite/:id_to_remove", { :controller => "favorites", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Review resource:

  # CREATE
  match("/new_review_form", { :controller => "reviews", :action => "blank_form", :via => "get" })
  match("/insert_review_record", { :controller => "reviews", :action => "save_new_info", :via => "post" })
  match("/item_review/:item_id", { :controller => "reviews", :action => "item_review", :via => "get" })

  # READ
  match("/reviews", { :controller => "reviews", :action => "list", :via => "get" })
  match("/reviews/:id_to_display", { :controller => "reviews", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_review_form/:id_to_prefill", { :controller => "reviews", :action => "prefilled_form", :via => "get" })
  match("/update_review_record/:id_to_modify", { :controller => "reviews", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_review/:id_to_remove", { :controller => "reviews", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Item resource:

  # CREATE
  match("/new_item_form", { :controller => "items", :action => "blank_form", :via => "get" })
  match("/insert_item_record", { :controller => "items", :action => "save_new_info", :via => "post" })
  match("/insert_item_record_review", { :controller => "items", :action => "save_new_info_addreview", :via => "post" })


  # READ
  match("/items", { :controller => "items", :action => "list", :via => "get" })
  match("/items/:id_to_display", { :controller => "items", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_item_form/:id_to_prefill", { :controller => "items", :action => "prefilled_form", :via => "get" })
  match("/update_item_record/:id_to_modify", { :controller => "items", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_item/:id_to_remove", { :controller => "items", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :users
  
  #self user links
  match("/my_profile", { :controller => "users", :action => "my_profile", :via => "get" })
  
  
  # Routes for the Restaurant resource:

  # CREATE
  match("/new_restaurant_form", { :controller => "restaurants", :action => "blank_form", :via => "get" })
  match("/insert_restaurant_record", { :controller => "restaurants", :action => "save_new_info", :via => "post" })
  match("/insert_restaurant_record_item", { :controller => "restaurants", :action => "save_new_info_additem", :via => "post" })


  # READ
  match("/restaurants", { :controller => "restaurants", :action => "list", :via => "get" })
  match("/restaurants/:id_to_display", { :controller => "restaurants", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_restaurant_form/:id_to_prefill", { :controller => "restaurants", :action => "prefilled_form", :via => "get" })
  match("/update_restaurant_record/:id_to_modify", { :controller => "restaurants", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_restaurant/:id_to_remove", { :controller => "restaurants", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
