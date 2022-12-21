require 'rails_helper'
# rubocop:disable Metrics/BlockLength
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
  it 'Should have user name Josh and mehsu' do
    visit users_path
    expect(page).to have_content('Josh')
    expect(page).to have_content('Meshu')
  end
  it 'I can see the profile picture for each user' do
    visit "users/#{@user1.id}"
    expect(page).to have_css('img', count: 1)
    visit "users/#{@user2.id}"
    expect(page).to have_css('img', count: 1)
  end
  it 'I can see the number of posts each user has written' do
    visit "users/#{@user1.id}"
    expect(page).to have_content('0 Posts')
    visit "users/#{@user2.id}"
    expect(page).to have_content('0 Posts')
  end

  it 'When I click on a user, I am redirected to that users show page.' do
    visit user_path(@user1)
    click_link @user1.name.to_s
    expect(current_path).to eq user_path(@user1)
  end
end
# rubocop:enable Metrics/BlockLength
