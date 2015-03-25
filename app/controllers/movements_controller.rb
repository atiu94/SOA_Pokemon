class MovementsController < ApplicationController

    require 'json' # Rails lib for JSON data handling
    require 'net/http' # Rails Lib for web manipulation
    require 'uri' # Helper Lib for net/http
    #require 'httparty' # Alternate Lib for web manipulation
    before_action :set_details

    SERVER_BASE_URL = "http://localhost:1337/" #Creating a const variable for web location
    #current_status_code = 0

    def index
      #parameters setup
      location = "#{SERVER_BASE_URL}Room1" # Takes us to the teacher's app entrypoint at Room1
      uri = URI.parse(location)

      # Setting up JSON datagram
      reply = {'name'=> @name , 'command' => @command , 'state' => @current_state_code}
      # Setting up headers for server to accept JSON datagram
      reply_headers = {"Content-Type" => "application/json",
         "Accept" => "application/json"}

      # Create new object to perform POST
      http = Net::HTTP.new(uri.host, uri.port)
      sendrequest = Net::HTTP::Post.new(uri.request_uri, reply_headers)
      sendrequest.body = reply.to_json
      response = http.request(sendrequest)

      payload = response.body

      @current_state_code = JSON.parse(payload)['status']
      @message = JSON.parse(payload)['message']
    end

    def move
      uri = URI.parse(@location)

      reply = {'name' => @name , 'command' => @command , 'state' => @current_state_code}
      reply_headers = {"Content-Type" => "application/json",
         "Accept" => "application/json"}

      # Create new object to perform POST
      http = Net::HTTP.new(uri.host, uri.port)
      sendrequest = Net::HTTP::Post.new(uri.request_uri, reply_headers)
      sendrequest.body = reply.to_json
      response = http.request(sendrequest)

      payload = response.body

      @current_state_code = JSON.parse(payload)['status']
      @message = JSON.parse(payload)['message']
      #@command = params[:command]
    end

    def command_form
      uri = URI.parse(@location)

      reply = {'name' => @name , 'command' => @command , 'state' => @current_state_code}
      reply_headers = {"Content-Type" => "application/json",
         "Accept" => "application/json"}

      # Create new object to perform POST
      http = Net::HTTP.new(uri.host, uri.port)
      sendrequest = Net::HTTP::Post.new(uri.request_uri, reply_headers)
      sendrequest.body = reply.to_json
      response = http.request(sendrequest)

      payload = response.body

      @current_state_code = JSON.parse(payload)['status']
      @message = JSON.parse(payload)['message']
    end

    def set_details
      @name = 'Regine'
      #@command = params[:command]
         @command = "look"
      @room = params[:roomno]
      @location = "#{SERVER_BASE_URL}#{@room}"
    end

    def get_command
      @command = params[:command]
    end

end
