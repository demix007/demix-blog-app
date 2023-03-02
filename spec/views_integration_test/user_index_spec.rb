require 'rails_helper'

RSpec.describe 'users Index Page', type: :feature do
  describe 'Index page' do
    before(:each) do
      @user1 = User.create!(
        name: 'Ayodeji abidemi', 
        photo: 'https://unsplash.com/photos/WNoLnJo7tS8',
        bio: 'Student at Microverse',
        posts_counter: 8
      )

      @user2 = User.create!(
        name: 'Abdul Saboor', 
        photo: 'https://unsplash.com/photos/WNoLnJo7tS8', 
        bio: 'Full Stack web Developer',
        posts_counter: 9
      )
    end

    it 'displays the user name' do
      visit users_path
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end

    it 'has the correct link' do
      visit users_path
      expect(page).to have_link(@user1.name, href: user_path(@user1))
      expect(page).to have_link(@user2.name, href: user_path(@user2))
    end

  end
end
