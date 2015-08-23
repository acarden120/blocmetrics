require 'rails_helper'

include Devise::TestHelpers

describe 'Add new application' do
  before do
    @user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  describe 'Submit with blank fields' do
    it 'it remains on the current page and displays flash message' do
      click_button 'Add'

      expect(current_path).to eq registered_applications_path(@user)
      expect(page).to have_content('There was an error registering the application. Please try again.')
    end
  end

  describe 'Submit with valid data' do
    it 'it redirects to the application show page' do
      fill_in 'registered_application_name', with: 'TestApp'
      fill_in 'registered_application_url', with: 'http://www.testapp.com'
      click_button 'Add'

      expect(current_path).to eq registered_applications_path(@user)
      expect(page).to have_content('Register a new application')
    end
  end

  describe 'Submit with duplicate url' do
    it 'it displays a flash error message' do
      fill_in 'registered_application_name', with: 'TestApp'
      fill_in 'registered_application_url', with: 'http://www.testapp.com'
      click_button 'Add'

      expect(current_path).to eq registered_applications_path(@user)
    end
  end
end
