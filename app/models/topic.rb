# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  name        :string
#  public      :boolean          default(TRUE)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Topic < ActiveRecord::Base

  has_many :posts, dependent: :destroy

  scope :visible_to, -> (user) { user ? all : where(public: true)}
  self.per_page = 50
end
