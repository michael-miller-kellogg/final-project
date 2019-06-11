# == Schema Information
#
# Table name: items
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  dish          :string
#  description   :string
#  vegetarian    :boolean
#  vegan         :boolean
#  glutenfree    :boolean
#  size          :string
#  price         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Item < ApplicationRecord
    
    def num_reviews
        return Review.where("item_id = ?", self.id).count
    end
    
    def restaurant_from
        return Restaurant.where("id=?", self.restaurant_id).first.place
    end
    
    def average_review
        
        if self.num_reviews==0
            return 0

        else
            
            a = 0
                Review.where("item_id =? ", self.id).each do |review|
                a = a + review.rating.to_f
            end
        
            average = a/self.num_reviews
            return average.round(2)
        end
    end
    
    belongs_to :restaurant
    has_many :reviews, :dependent => :destroy
    has_many :favorites, :dependent => :destroy
end
