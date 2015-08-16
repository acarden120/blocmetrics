require 'rails_helper'

include Devise::TestHelpers

describe RegisteredApplicationsController do
  describe 'GET #index' do
    before do
      @user = create(:user)
      sign_in @user
      @registered_applications = create_list(:registered_application, 10, user: @user)
      get 'index'
    end
    it { should render_template('index') }
    it 'populates array of registered applications' do
      expect(assigns(:registered_applications)).to match_array(@registered_applications)
    end
  end

  describe 'GET #show' do
    before do
      @user = create(:user)
      @test_app = FactoryGirl.create(:registered_application, user: @user)
      sign_in @user
      get :show, id: @test_app
    end
    it { should render_template('show') }
    it 'assigns the registered application to @registered_application' do
      expect(assigns(:registered_application)).to match(@test_app)
    end
  end
end
