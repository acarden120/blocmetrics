require 'rails_helper'

include Devise::TestHelpers

describe 'Sign in flow' do
  describe 'successful' do
    it 'it redirects to the root path' do
      user = FactoryGirl.create(:user)
      visit root_path

      within 'nav.navbar.navbar-default' do
        click_link 'Sign In'
      end

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      within 'form' do
        click_button 'Log in'
      end

      expect(page).to have_css('h2', text: 'Welcome to Blocmetrics')
      expect(current_path).to eq root_path
    end
  end

  describe 'unsuccessful login' do
    it 'it does not redirect to the root path' do
      user = FactoryGirl.create(:user)
      visit root_path

      within 'nav.navbar.navbar-default' do
        click_link 'Sign In'
      end

      fill_in 'Email', with: user.name
      fill_in 'Password', with: user.password

      within 'form' do
        click_button 'Log in'
      end

      expect(page).to_not have_css('h2', text: 'Welcome to Blocmetrics')
      expect(current_path).to_not eq root_path
    end
  end
end
