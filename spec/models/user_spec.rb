# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  avatar                 :string
#  role                   :string
#  email_favorites        :boolean          default(TRUE)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'
 
 describe User do
 
   include TestFactories

   describe ".top_rated" do

    before do
      @user1 = create(:user_with_post_and_comment)
      post = @user1.posts.first

      @user2 = create(:user_with_post_and_comment)
      post = @user2.posts.first
      create(:comment, user: @user2, post: post)
    end

    it "returns users ordered by comments + posts" do
      expect(User.top_rated).to eq([@user2, @user1])
    end

    it "stores a 'posts_count' on user" do
      users = User.top_rated
      expect(users.first.posts_count).to eq(1)
    end

    it "stores a 'comments_count' on user" do
      users = User.top_rated
      expect(users.first.comments_count).to eq(2)
    end
  end
end

