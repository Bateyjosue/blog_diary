require 'rails_helper'
# rubocop:disable Metrics/BlockLength
describe User, type: :feature do
  before :each do
    @user1 = User.create(name: 'Ema',
                         photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                         bio: 'Here my story',
                         posts_counter: 3)
  end

  it 'should have username Ema' do
    visit user_path(@user1)
    expect(page).to have_content('Ema')
  end

  it 'should display number of posts by Ema' do
    visit user_path(@user1)
    Post.create(author: @user1, title: 'Introduction to rails', text: 'Rails is a web', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: @user1, title: 'Introduction to testing', text: 'Rails is a web', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: @user1, title: 'Introduction to Capybara', text: 'Rails is a web', comments_counter: 0,
                likes_counter: 0)
    count = Post.where(author_id: @user1.id)
    expect(page).to_not have_content("#{count} Posts")
  end

  it 'should display users profile picture' do
    visit users_path(@user1)
    expect(page).to have_css("img[src*='#{@user1.photo}']")
  end

  it 'should display user bio' do
    visit user_path(@user1)
    expect(page).to have_content(@user1.bio)
  end

  it 'should display first three posts' do
    Post.create(author: @user1, title: 'Introduction to testing', text: 'Rails is a web', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: @user1, title: 'Introduction to Capybara', text: 'Rails is a web', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: @user1, title: 'Introduction to migration', text: 'Rails is a web', comments_counter: 0,
                likes_counter: 0)
    visit user_path(@user1)

    expect(page).to have_content('Introduction to testing')
    expect(page).to have_content('Introduction to testing')
    expect(page).to have_content('Introduction to migration')
  end

  it 'should display button that allows to see all posts' do
    visit user_path(@user1)

    expect(page).to have_link('See all post')
  end

  it 'should redirect to user index page' do
    visit user_path(@user1)
    click_link('See all post')
    expect(current_path).to eq(user_posts_path(@user1))
  end

  it 'should redirect to user show page' do
    @post = Post.create(author: @user1, title: 'Introduction to rails', text: 'Rails is a web', comments_counter: 0, likes_counter: 0)
    visit user_posts_path(@user1)
    click_link @post.title
    expect(user_posts_path(@user1)).to_not  eq("users/#{@user1.id}/posts/#{@post.id}")
  end
end

# rubocop:enable Metrics/BlockLength
