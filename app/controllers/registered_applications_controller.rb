class RegisteredApplicationsController < ApplicationController
  def index
    @Applications = RegisteredApplication.all    
  end
end
