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
 
   describe "#favorited(post)" do
      before do
       @post = associated_post
       @other_post = associated_post
       @user = authenticated_user(email_favorites: true)
       @other_user = authenticated_user
       @favorite = @post.favorites.create(post: @post, user: @user)
       @other_favorite = @other_post.favorites.create(post: @post, user: @other_user)

     end
     it "returns `nil` if the user has not favorited the post" do
      expect( @other_user.favorites.find_by_post_id(@post.id) ).to be_nil
     end
 
     it "returns the appropriate favorite if it exists" do
      expect( @user.favorites.find_by_post_id(@post.id) ).not_to be_nil
     end

     it "returns `nil` if the user has favorited another post" do
      expect( @user.favorites.find_by_post_id(@other_post.id) ).to be_nil
     end

   end
 end
