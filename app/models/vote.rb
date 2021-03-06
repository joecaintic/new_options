# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  value      :integer
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_votes_on_post_id  (post_id)
#  index_votes_on_user_id  (user_id)
#

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }

  after_save :update_post

   def up_vote?
     value == 1
   end
 
   def down_vote?
     value == -1
   end

  private

  def update_post
    post.update_rank
  end


end
