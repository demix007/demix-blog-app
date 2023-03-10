require 'rails_helper'
RSpec.describe 'Posts Show', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Ayodeji Abidemi',
      bio: 'Abidemi is a rails developer',
      photo: 'https://picsum.photos/400/250',
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
      likes_counter: 0,
      comments_counter: 0
    )

    @post = Post.create(
      author_id: @user1.id,
      title: 'This is the title of the post',
      text: 'This is the text contained in the post',
      likes_counter: 0,
      comments_counter: 0
    )

    Like.create(post_id: @post.id, author_id: @user2.id)
    Like.create(post_id: @post.id, author_id: @user1.id)
    Comment.create(post_id: @post.id, author_id: @user2.id, text: 'This is a nice project')
    Comment.create(post_id: @post.id, author_id: @user1.id, text: 'This comment was created by user 1')
    Comment.create(post_id: @post.id, author_id: @user2.id, text: 'Nice post')
    Comment.create(post_id: @post.id, author_id: @user2.id, text: 'Another Nice post')
  end

  describe 'Post show page' do
    it 'is to display the post author' do
      visit user_post_path(@user1, @post.id)
      expect(page).to have_content('Ayodeji Abidemi')
    end

    it 'is to display the likes counter' do
      visit user_post_path(@user1, @post.id)
      expect(page).to have_content('Likes: 2')
    end

    it 'is to display the comments counter' do
      visit user_post_path(@user1, @post.id)
      expect(page).to have_content('Comments: 4')
    end

    it 'is to display the comment text' do
      visit user_post_path(@user1, @post.id)
      expect(page).to have_content('This is a nice project')
      expect(page).to have_content('This comment was created by user 1')
      expect(page).to have_content('Nice post')
    end

    it 'is to display the user name of each user with comments' do
      visit user_post_path(@user1, @post.id)
      expect(page).to have_content('Demix')
    end

    it 'is to display the post body' do
      visit user_post_path(@user1, @post.id)
      expect(page).to have_content('This is the text contained in the post')
    end
  end
end
