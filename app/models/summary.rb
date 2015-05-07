# == Schema Information
#
# Table name: summaries
#
#  id          :integer          not null, primary key
#  name        :string
#  public      :boolean          default(TRUE)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  post_id     :integer
#
# Indexes
#
#  index_summaries_on_post_id  (post_id)
#

class Summary < ActiveRecord::Base
  belongs_to :post
end
