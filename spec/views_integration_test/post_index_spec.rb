require 'rails_helper'
RSpec.describe 'Posts Show', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Ayodeji Abidemi',
      photo: 'https://picsum.photos/400/250',
      bio: 'Abidemi is a rails developer',
      posts_counter: 8
    )

end