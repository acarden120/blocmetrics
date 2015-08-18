class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_filter :set_access_control_headers
 
  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    if !registered_application
      render json: "Unregistered application", status: :unprocessable_entity
    else
      @event = registered_application.events.new(event_params)
      binding.pry
      if @event.save
        render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    end

    respond_to do |format|
      format.html
      format.js
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
