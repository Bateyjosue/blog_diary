require 'rails_helper'

# Test user model

RSpec.describe User, type: :model do
  subject { User.new(name: 'Josh', photo: 'photo.png', bio: 'Here is my Bio', posts_counter: 0) }

  before { subject.save }
  it 'should return true if name is present' do
    expect(subject).to be_valid
  end

  it 'should return false if name is nil' do
    subject.name = nill
    expect(subject).to_not be_valid
  end

  it 'post counter should be an integer' do
    subject.posts_counter = 'one'
    expect(subject).to_not be_valid
  end

  it 'should return recent three post ' do
    subject.posts.create(title: 'Post 1', text: 'Post text 1')
    subject.posts.create(title: 'Post 2', text: 'Post text 2')
    subject.posts.create(title: 'Post 3', text: 'Post text 3')
    subject.posts.create(title: 'Post 4', text: 'Post text 4')

    expect(subject.latest_three_posts.count).to eq(3)
  end
end
