require 'rails_helper'

include Devise::TestHelpers

describe RegisteredApplicationsController do
  describe "GET #index" do
    # before { get :index }

    before do
     @user = create(:user)
     sign_in @user 
     @registered_applications = create_list(:registered_application, 10, user: @user)
     get 'index'
   end
    it { should render_template('index') }
    it "populates array of registered applications " do
      expect(assigns(:registered_applications)).to match_array(@registered_applications)
    end
  end
  
  describe "GET #show" do
    it "assigns the registered application to @registered_application"
    it "renders the :show template"
  end
  
  describe "GET #new" do
    it "assigns a new Contact to @registered_application"
    it "renders the :new template"
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new registered application in the database"
      it "redirects to the home page"
    end
    
    context "with invalid attributes" do
      it "does not save the new registered application in the database"
      it "re-renders the :new template"
    end
  end
end