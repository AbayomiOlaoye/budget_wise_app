require 'rails_helper'

RSpec.feature 'records index page', js: true, type: :feature do
  background do
    visit user_session_path
    @user = User.create!(name: 'Ola Mag', email: 'olamag@mail.com', password: '1234567')

    fill_in 'Email', with: 'olamag@mail.com'
    fill_in 'Password', with: '1234567'
    click_button 'Log in'

    @category = @user.categories.create!(name: 'Drinks')

    @category.icon.attach(
      io: File.open(Rails.root.join('spec', 'fixtures', 'ice.jpeg')),
      filename: 'ice.jpeg',
      content_type: 'application/jpeg'
    )

    @category.records.create!(user: @user, name: 'Music', amount: 1000)

    @category.save!
    visit category_records_path(@category)
  end

  it 'should see users categories' do
    expect(page).to have_content 'Music'
  end

  it 'should show total amount' do
    expect(page).to have_content 'NGN 1000'
  end

  it 'should have a "TRANSACTION" button' do
    expect(page).to have_content 'TRANSACTION'
  end
end
