require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe Post, type: :feature do
  before :each do
    @user1 = User.create(
      name: 'Josh',
      photo: 'https://media-exp1.licdn.com/dms/image/D4D03AQEQHOj-BBrfzQ/profile-displayphoto-shrink_400_400/0/1664645715667?e=1672272000&v=beta&t=WiD4Rh1dlO_HKq2XD0U1hkufBrcD7Wltk2GinHzMDxo',
      bio: 'Javascript|Python|Django|React|Redux|Ruby|Postgres. In love with pair-programming, and remote work. ',
      posts_counter: 0
    )

    @post1 = Post.create(
      title: 'Get to know chatGPT',
      text: 'Its pretrained AI chatbot',
      comments_counter: 0,
      likes_counter: 0,
      author: @user1
    )

    @comment1 = Comment.create(
      text: 'This is changing the store about AI',
      post: @post1,
      author: @user1
    )

    visit("users/#{@user1.id}/posts/#{@post1.id}")
  end

  it 'should have the post title' do
    expect(page).to have_content(@post1.title)
  end

  it 'should have the post\'s author' do
    expect(page).to have_content(@post1.author.name)
  end

  it 'should have the post\'s comments count' do
    expect(page).to have_content("comment#{@post1.comments_counter}")
  end

  it 'should have the post\'s likes count' do
    expect(page).to have_content("favorite#{@post1.likes_counter}")
  end
  it 'should have the post\'s body' do
    expect(page).to have_content(@post1.text)
  end

  it 'should have the commentor name' do
    expect(page).to have_content @comment1.author.name
  end

  it 'should have the commentor comment he left' do
    expect(page).to have_content @comment1.text
  end
end

# rubocop:enable Metrics/BlockLength
