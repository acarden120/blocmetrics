require 'rails_helper'

describe 'Sign in flow' do
  describe 'successful' do
    it 'redirects to the blocmetrics index' do
      visit root_path

      within 'nav.navbar.navbar-default' do
        click_link 'Sign In'
      end

      fill_in 'Email', with: 'test2@example.com'
      fill_in 'Password', with: 'abc654321'

      within 'form' do
        click_button 'Log In'
      end

      expect(current_path).to eq root_path
    end
  end
end
