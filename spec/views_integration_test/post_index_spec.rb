require 'rails_helper'
RSpec.describe 'Posts Show', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Ayodeji Abidemi',
      photo: 'https://picsum.photos/400/250',
      bio: 'Abidemi is a rails developer',
      posts_counter: 8
    )

    @user2 = User.create(
        name: 'Demix',
        bio: 'A student at Microverse',
        photo: 'https://picsum.photos/350/250',
        posts_counter: 5
    )

    @post = Post.create(
        author_id: @user1.id,
        title: 'This is the title of the post',
        text: 'This is the text contained in the post',
        comments_counter: 0,
        likes_counter: 0
    )

end