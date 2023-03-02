require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before(:each) do
    @user = User.create!(
      name: 'Ayodeji Abidemi', 
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Best friends', 
      posts_counter: 12
    )

    @post = Post.create!(
      title: 'New Post', 
      text: 'This is another post from Ayodeji Abidemi', 
      comments_counter: 26, 
      likes_counter: 26,
      author: @user
    )
  end
end
