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
    belongs_to :restaurant
    has_many :reviews, :dependent => :destroy
    has_many :favorites, :dependent => :destroy
end
