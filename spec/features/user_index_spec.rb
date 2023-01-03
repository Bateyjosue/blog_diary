require 'rails_helper'
describe User, type: :feature do
  before :all do
    @user1 = User.create(name: 'Josh', photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                         bio: 'Here my story',
                         posts_counter: 0)
    @user2 = User.create(name: 'Meshu',
                         photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                         bio: 'Here my story',
                         posts_counter: 0)
  end

  it 'should display username' do
    visit users_path(@user1)
    expect(page).to have_content @user1.name
  end

  it 'should display users profile picture' do
    visit users_path(@user1)
    expect(page).to have_css("img[src*='#{@user1.photo}']")
  end

  it 'should display number of posts by given user' do
    visit users_path(@user1)
    expect(page).to have_content('0 Posts')
    visit users_path(@user2)
    expect(page).to have_content('0 Posts')
  end

  it 'should redirect to user show page' do
    visit users_path(@user1)
    click_link @user1.name
    expect(users_path(@user1)).to_not eq("users/#{@user1.id}")
  end
end
