require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Ayodeji', photo: 'Ayodeji Photo URL', bio: 'A Full-stack Web Developer', posts_counter: 5) }

  before { subject.save }

  it 'expects the user name to be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'expects the user name to not be too long' do
    subject.name = 'Ayodeji' * 200
    expect(subject).to_not be_valid
  end

  it 'expects the user name to not be too short' do
    subject.name = 'a'
    expect(subject).to_not be_valid
  end

  it 'expects the posts_counter to only be valid when it is an integer' do
    subject.posts_counter = 'abc'
    expect(subject).to_not be_valid
  end

  it 'expects the bio to not be empty' do
    subject.bio = ' '
    expect(subject).to_not be_valid
  end

  it 'expects the bio to have a valid value' do
    expect(subject.bio).to eql 'A Full-stack Web Developer'
  end

  it 'expect photo to have a valid value' do
    expect(subject.photo).to eql 'Ayodeji Photo URL'
  end

  it 'expects the posts_counter to be greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it ' Should test posts_counter to be >= 0' do
    expect(subject.posts_counter).to be >= 0
  end
end
