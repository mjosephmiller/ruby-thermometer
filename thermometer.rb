require 'open-uri'
require 'json'
require 'httparty'
require 'dotenv'

class Thermometer

  attr_reader :temperature, :city, :weather_hash
  attr_accessor :temperature, :weather_hash

  def initialize(city)
    @temperature = []
    @city = city
    @weather_hash = {}
  end

  def get_temp
    @weather_hash = HTTParty.get("http://api.wunderground.com/api/" + "#{ENV["WEATHER_API"]}" + "/hourly10day/lang:NL/q/IT/#{@city}.xml")
  end

  def assign_values
    hourly_forecast_response = @weather_hash.parsed_response['response']['hourly_forecast']['forecast'].first
    @temperature = hourly_forecast_response['temp']['metric']
  end

end
