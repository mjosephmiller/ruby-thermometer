require 'httparty'
require 'dotenv'

class Thermometer

  attr_reader :temperature, :city, :weather_hash, :country
  attr_accessor :temperature, :weather_hash

  def initialize(city, country)
    @temperature = []
    @city = city
    @country = country
    @weather_hash = {}
  end

  def get_temp
    @weather_hash = HTTParty.get("http://api.wunderground.com/api/" + "#{ENV["WEATHER_API"]}" + "/hourly10day/lang:NL/q/#{@country}/#{@city}.xml")
  end

  def assign_values
    hourly_forecast_response = @weather_hash.parsed_response['response']['hourly_forecast']['forecast'].first
    @temperature = hourly_forecast_response['temp']['metric']
  end

end
