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
  end
end
