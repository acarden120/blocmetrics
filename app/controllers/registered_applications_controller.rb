class RegisteredApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @registered_applications = current_user.registered_applications.all
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def show
    @user = current_user
    @registered_application = @user.registered_applications.find(params[:id])
  end

  def create
    @user = current_user
    @registered_application = current_user.registered_applications.build(app_params)
    @registered_application.user = @user

    if @registered_application.save
      flash[:notice] = 'Application has been registered'
    else
      flash[:error] = 'There was an error registering the application. Please try again.'
    end
    redirect_to registered_applications_path(current_user)
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      redirect_to registered_applications_path(current_user)
      flash[:notice] = 'The application was deleted'
    else
      flash[:error] = 'There was an error deleting the application. Please try again.'
    end
  end

  private

  def app_params
    params.require(:registered_application).permit(:name, :url)
  end
end
