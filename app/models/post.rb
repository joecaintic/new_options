# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  topic_id   :integer
#  summary_id :integer
#
# Indexes
#
#  index_posts_on_summary_id  (summary_id)
#  index_posts_on_topic_id    (topic_id)
#  index_posts_on_user_id     (user_id)
#

class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic
  has_one :summary

  default_scope { order('created_at DESC') }
end
