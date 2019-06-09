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
    
    
    def average_review
        
        if self.num_reviews==0
            return 0

        else
            
            a = 0
                Review.where("item_id =? ", self.id).each do |review|
                a = a + review.rating.to_f
            end
        
            return a/self.num_reviews
        end
    end
    
    belongs_to :restaurant
    has_many :reviews, :dependent => :destroy
    has_many :favorites, :dependent => :destroy
end
