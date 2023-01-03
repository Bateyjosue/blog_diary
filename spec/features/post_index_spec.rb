require 'rails_helper'
#  rubocop:disable Metrics/BlockLength
describe Post, type: :feature do
  before :each do
    @user1 = User.create(
      name: 'Josh',
      photo: 'https://media-exp1.licdn.com/dms/image/D4D03AQEQHOj-BBrfzQ/profile-displayphoto-shrink_400_400/0/1664645715667?e=1672272000&v=beta&t=WiD4Rh1dlO_HKq2XD0U1hkufBrcD7Wltk2GinHzMDxo',
      bio: 'Javascript|Python|Django|React|Redux|Ruby|Postgres. In love with pair-programming, and remote work.',
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
  end

  it 'should  have an image' do
    visit("users/#{@user1.id}/posts")
    expect(page).to have_css('img', count: 1)
  end

  it 'should have a username' do
    visit("users/#{@user1.id}/posts")

    expect(page).to have_content @post1.author.name
  end

  it 'should have the post title' do
    visit("users/#{@user1.id}/posts")

    expect(page).to have_content(@post1.title)
  end

  it 'should have the post body' do
    visit("users/#{@user1.id}/posts")

    expect(page).to have_content @post1.text
  end

  it 'should see some posts comments' do
    visit("users/#{@user1.id}/posts")

    expect(page).to have_content @comment1.text
  end
  it 'should have comment number' do
    visit("users/#{@user1.id}/posts")

    expect(page).to have_content @post1.comments_counter.to_s
  end

  it 'should have likes number' do
    visit("users/#{@user1.id}/posts")
    expect(page).to have_content @post1.likes_counter.to_s
  end

  if Post.all.count > 2
    it 'should have pagination post fit the view' do
      visit("users/#{@user1.id}/posts")
      expect(page).to have_content 'Pagination'
    end
  else
    it 'should not have pagination post' do
      visit("users/#{@user1.id}/posts")
      expect(page).to have_no_content 'Pagination'
    end
  end

  it 'should redirect to a post' do
    visit("users/#{@user1.id}/posts")
    click_link @post1.title.to_s
    expect(current_path).to eq(user_post_path(@user1, @post1.id))
  end
end

# rubocop:enable Metrics/BlockLength
