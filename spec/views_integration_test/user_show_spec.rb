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

  describe 'User show page' do
    before(:each) { visit user_path(id: @user.id) }

    it "is to display the user's name" do
      expect(page).to have_content(@user.name)
    end

    it "is to redirect to the user's path" do
        expect(page).to have_link(@user.name, href: user_path(id: @user.id))
    end

    it 'is to display the right container for the users' do
        expect(page).to have_css('section.user_container')
    end

    it "displays the user's Image" do
        expect(page.has_xpath?("//img[@src = '#{@user.photo}' ]"))
    end

    it "displays the user's bio" do
        expect(page).to have_content(@user.bio)
        expect(page).to have_content('Bio')
    end

    it 'shows the total number of posts from the user' do
        expect(page).to have_content("Number of posts: #{@user.posts_counter || 0}")
    end

    it 'verifies that there is a button to view all posts from users' do
        expect(page).to have_link('Click to view all Posts', href: user_posts_path(user_id: @user.id))
    end
  end
end
