require 'rails_helper'

RSpec.describe 'PostIndex', type: :feature do
  describe 'Post Index page' do
    before(:each) do
      @user1 = User.create(
        name: 'Ayodeji Abidemi',
        photo: 'https://unsplash.com/photos/WNoLnJo7tS8',
        posts_counter: 2,
        bio: 'developer'
      )

      @post1 = Post.create(
        title: 'First Mock Post',
        text: 'I like First Mock Post',
        comments_counter: 4,
        likes_counter: 7,
        author_id: @user1.id
      )

      @post2 = Post.create(
        title: 'Second Mock Post',
        text: 'He likes criket',
        comments_counter: 6,
        likes_counter: 9,
        author_id: @user1.id
      )

      @post3 = Post.create(
        title: 'Third Mock Post',
        text: 'He likes tennis',
        comments_counter: 8,
        likes_counter: 14,
        author_id: @user1.id
      )

      @comment1 = Comment.create(
        text: 'This is the first comment',
        author_id: @user1.id,
        post_id: @post1.id
      )

      @comment2 = Comment.create(
        text: 'This is the second comment',
        author_id: @user1.id,
        post_id: @post1.id
      )

      @comment3 = Comment.create(
        text: 'This is the third comment',
        author_id: @user1.id,
        post_id: @post1.id
      )

      visit user_posts_path(@user1.id)
    end

    it 'displays the username' do
      expect(page).to have_content(@user1.name)
    end

    it 'displays user profile image' do
      expect(page).to have_css("img[src='https://unsplash.com/photos/WNoLnJo7tS8']")
    end

    it 'displays the title of posts' do
      expect(page).to have_content('Post #')
    end

    it 'displays the post body' do
      expect(page).to have_content(@post1.text)
    end

    it 'display total number of posts by a user' do
      expect(page).to have_content(@user1.posts_counter)
    end

    it 'displays total likes for a post' do
      expect(page).to have_content(@post1.likes_counter)
    end

    it 'displays the first comment made by a user' do
      expect(page).to have_content(@comment3.text)
    end

    it 'displays post comments counter' do
      expect(page).to have_content(@post1.comments_counter)
    end

    it 'shows a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content('Pagination')
    end

    it 'shows pagination button' do
      visit "/users/#{@user1.id}/posts"
      expect(page).to have_content('Pagination')
    end
  end
end
