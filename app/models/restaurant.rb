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
    has_many :items, :dependent => :destroy
end
