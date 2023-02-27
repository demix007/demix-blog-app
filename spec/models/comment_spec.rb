require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'This is a nice post', author_id: 7, post_id: 7) }
  before { subject.save }

  it 'expects text to be present in the comment' do
    subject.text.nil?
    expect(subject).to_not be_valid
  end

  it 'expects author_id to be present in the comment' do
    subject.author_id.nil?
    expect(subject).to_not be_valid
  end

  it 'expects author_id to be an integer' do
    subject.author_id = 'abc'
    expect(subject).to_not be_valid
  end

  it 'expects author_id to be valid' do
    expect(subject.author_id).to eql 7
  end

  it 'expects post_id to be present in the comment' do
    subject.post_id.nil?
    expect(subject).to_not be_valid
  end

  it 'expects post_id to be an integer' do
    subject.post_id = 'abc'
    expect(subject).to_not be_valid
  end

  it 'expects post_id to be valid' do
    expect(subject.post_id).to eql 7
  end
end
