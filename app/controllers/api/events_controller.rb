class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_filter :set_access_control_headers
 
  def create
#  Rails.logger.debug 'Create started'
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
# Rails.logger.debug registered_application.inspect
    if !registered_application
      render json: "Unregistered application", status: :unprocessable_entity
    else
      @event = registered_application.events.new(event_params)
      puts @event.inspect
#      Rails.logger.debug @event.errors.inspect

      puts "*********************************************************"
      puts "*********************************************************"
      puts "*********************************************************"
      puts "*********************************************************"
      puts "*********************************************************"
      puts "*********************************************************"
      puts "*********************Name: #{@event.name}****************"
      puts "*********************************************************"
      puts "*********************************************************"
      puts "*********************************************************"
      puts "*********event_params: #{event_params}*****************"
      puts "*********************************************************"
      puts "*********************************************************"
      puts "*********************************************************"

#      binding.pry
      if @event.save
        render json: @event, status: :created
      else
 #       binding.pry
        render @event.errors, status: :unprocessable_entity
      end
    end
  end

  def set_access_control_headers
     headers['Access-Control-Allow-Origin'] = '*'
     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
     headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  private

  def event_params
    params.permit(:name)
  end
end
