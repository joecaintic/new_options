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

require 'rails_helper'

describe Vote do
  describe "validations" do


    before do
       @post = Post.create(title: 'Post title', body: 'Post bodies must be pretty long.')
       @vote = @post.votes.create(value: 1)
       
     end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @vote.value ).to eq(1).or eq(-1)
      end
    end
  end
end
