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

    @post = Post.create(
        author_id: @user1.id,
        title: 'This is the title of the post',
        text: 'This is the text contained in the post',
        comments_counter: 0,
        likes_counter: 0
    )

    Like.create(post_id: @post.id, author_id: @user2.id)
    Like.create(post_id: @post.id, author_id: @user1.id)
    
    Comment.create(post_id: @post.id, author_id: @user2.id, text: 'This is a nice project')
    Comment.create(post_id: @post.id, author_id: @user1.id, text: 'This comment was created by user 1')
    Comment.create(post_id: @post.id, author_id: @user2.id, text: 'Nice post')
    Comment.create(post_id: @post.id, author_id: @user2.id, text: 'Another Nice post')

    describe 'Post Index Page' do
        it 'is to display the post author' do
          visit user_post_path(@user1, @post.id)
          expect(page).to have_content('Ayodeji Abidemi')
        end
    end
end