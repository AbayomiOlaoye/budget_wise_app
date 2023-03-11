require 'rails_helper'

RSpec.feature 'categories index page', js: true, type: :feature do
  background do
    visit user_session_path
    @user = User.create!(name: 'Ola Mag', email: 'userola@mail.com', password: '1234567')

    fill_in 'Email', with: 'userola@mail.com'
    fill_in 'Password', with: '1234567'
    click_button 'Log in'

    @category = @user.categories.create!(name: 'Drinks')

    @category.icon.attach(
      io: File.open(Rails.root.join('spec', 'fixtures', 'ice.jpeg')),
      filename: 'ice.jpeg',
      content_type: 'application/jpeg'
    )
    @category.save!
    visit categories_path
  end

  it 'should see users categories' do
    expect(page).to have_content 'Drinks'
  end

  it 'should show total amount' do
    expect(page).to have_content 'Total: NGN 0'
  end

  it 'should have a "CATEGORIES" button' do
    expect(page).to have_content 'CATEGORIES'
  end
end
