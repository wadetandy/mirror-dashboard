require 'open_weather'

class WeatherController < ApplicationController
  WASHINGTON_DC = 4140963

  respond_to :json

  def show
    @weather = Weather.find_by_city_id(WASHINGTON_DC)

    respond_with @weather
  end

  private
  def open_weather_options
    {
      APPID: OPEN_WEATHER_API_KEY
    }
  end
end
