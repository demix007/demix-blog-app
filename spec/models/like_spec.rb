require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(author_id: 10, post_id: 20) }
  before { subject.save }

  it 'expects author_id to be present in the Like' do
    subject.author_id.nil?
    expect(subject).to_not be_valid
  end

  it 'expects author_id to be an integer' do
    subject.author_id = 'abc'
    expect(subject).to_not be_valid
  end

  it 'expects author_id to be valid' do
    expect(subject.author_id).to eql 10
  end

  it 'expects post_id to be present in the Like' do
    subject.post_id.nil?
    expect(subject).to_not be_valid
  end

  it 'expects post_id to be an integer' do
    subject.post_id = 'abc'
    expect(subject).to_not be_valid
  end

  it 'expects post_id to be valid' do
    expect(subject.post_id).to eql 20
  end
end
