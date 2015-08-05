class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_filter :set_access_control_headers
 
  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    puts "*********************************************"
    puts "*********************************************"
    puts "*********************************************"
    puts "*********************************************"
    puts "*********************************************"
    puts "*********************************************"
    puts "*********************************************"
    puts "*********************************************"
    puts "*********************************************"
    puts "*********************************************"
    puts "*********************************************"
    puts "*********************************************"
    puts "*********************************************"
    puts "*********************************************"
    puts "*********************************************"
    puts "*********************************************"

    if !registered_application
      render json: "Unregistered application", status: :unprocessable_entity
    else
      @event = registered_application.events.new(event_params)
      if @event.save
        puts "nothing to see here"
        render json: @event, status: :created
      else
        render "There is something strange happening here."
#        render @event.errors, status: :unprocessable_entity
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
    params.permit(:event_name)
  end
end
