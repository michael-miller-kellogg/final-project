# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  place      :string
#  website    :string
#  cuisine    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ApplicationRecord
    
    def num_reviews
        
        num=0
        Item.where("restaurant_id = ?", self.id).each do |item|
         num = num + item.num_reviews
        end
        
        return num
        
    end
    
    
    def average_review
        
        if self.num_reviews==0
            return 0
        else
            
            a = 0
                Item.where("restaurant_id =? ", self.id).each do |item|
                a = a + item.average_review * item.num_reviews
            end
        
            average = a/self.num_reviews
            return average.round(1)
        end
    end
    
    has_many :items, :dependent => :destroy
end
