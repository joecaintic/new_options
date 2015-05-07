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
<<<<<<< HEAD
#  summary_id :integer
=======
#  image      :string
#
# Indexes
#
#  index_posts_on_topic_id  (topic_id)
#  index_posts_on_user_id   (user_id)
>>>>>>> checkpoint-16-pagination
#

class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic
<<<<<<< HEAD
    mount_uploader :image, ImageUploader
=======
  has_one :summary
>>>>>>> checkpoint-16-pagination

  default_scope { order('created_at DESC') }

    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true

end
