# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  feedback   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feedback < ApplicationRecord
    belongs_to :user
end
