require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before(:each) do
    @user = User.create!(
      name: 'Ayodeji Abidemi', 
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Best friends', 
      posts_counter: 12
    )

 
end
