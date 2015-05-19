# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  value      :integer
#  user_id_id :integer
#  post_id_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_votes_on_post_id_id  (post_id_id)
#  index_votes_on_user_id_id  (user_id_id)
#

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end
