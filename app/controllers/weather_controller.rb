require 'open_weather'

class WeatherController < ApplicationController
  WASHINGTON_DC = 4140963
  OPEN_WEATHER_API_KEY = 'c4b70d6aa62659b456bce2007f59a09c'

  respond_to :json

  def show
    weather = {
      current:  ::OpenWeather::Current.city_id(WASHINGTON_DC, open_weather_options),
      forecast: ::OpenWeather::Forecast.city_id(WASHINGTON_DC, open_weather_options)
    }

    respond_with weather
  end

  private
  def open_weather_options
    {
      APPID: OPEN_WEATHER_API_KEY
    }
  end
end
