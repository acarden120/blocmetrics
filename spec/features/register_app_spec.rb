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
      expect(page).to have_content('There was an error saving the application. Please try again.')
    end
  end

  describe 'Submit with valid data' do
    it 'it redirects to the application show page' do
      fill_in 'Email', with: 'TestApp'
      fill_in 'Password', with: 'http://www.testapp.com'
      click_button 'Login'

      expect(current_path).to eq registered_applications_path(@user)
      expect(page).to have_content('Register a new application')
    end
  end

=begin
  describe 'Submit with duplicate url' do
    it 'it redirects to the application show page' do
      fill_in 'name', with: 'TestApp'
      fill_in 'url', with: 'http://www.testapp.com'
      click_button 'Add'

      expect(current_path).to eq registered_applications_path(@user)
      expect(page).to have_content('Register a new application')
    end
  end
=end
end
