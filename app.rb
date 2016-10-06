require 'sinatra/base'
require 'sinatra/reloader'
require 'slim'
require 'httparty'
require './thermometer'

class ThermometerApp < Sinatra::Base
  get '/' do
    slim :index
  end

  post '/' do
    city = params[:city]
    @city = city.split(/ |\_|\-/).map(&:capitalize).join(" ")
    thermometer = Thermometer.new(@city)
    thermometer.get_temp
    thermometer.assign_values
    @temperature = thermometer.temperature
    slim :city
  end

  run! if app_file == $0

end
