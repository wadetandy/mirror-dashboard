class Weather
  include ActiveModel::Model
  include ActiveModel::Serializers::JSON

  OPEN_WEATHER_API_KEY = 'c4b70d6aa62659b456bce2007f59a09c'

  attr_reader :attributes, :id

  def self.find_by_city_id(city_id)
    weather = {
      current:  ::OpenWeather::Current.city_id(city_id, open_weather_options),
      forecast: ::OpenWeather::Forecast.city_id(city_id, open_weather_options),
      id: city_id
    }.with_indifferent_access

    self.new(weather)
  end

  def initialize(attributes = {})
    @attributes = attributes
    @id = attributes[:id]
  end

  def location
    @location ||= attributes[:forecast]['city']
  end

  def current
    @current ||= Snapshot.new(attributes[:current].merge({id: @id}))
  end

  def forecast
    @forecast ||= attributes[:forecast][:list].map { |i| Snapshot.new(i) }
  end

  def read_attribute_for_serialization(key)
    if self.respond_to?(key)
      self.send(key)
    end
  end

  def active_model_serializer
    WeatherSerializer
  end

  private
  def self.open_weather_options
    {
      APPID: OPEN_WEATHER_API_KEY
    }
  end

  class Snapshot
    include ActiveModel::Model
    include ActiveModel::Serializers::JSON

    attr_reader :attributes, :id

    def initialize(attributes = {})
      @attributes = attributes
      @id = attributes[:id]
    end

    def read_attribute_for_serialization(key)
      if self.respond_to?(key)
        self.send(key)
      else
        attributes[key]
      end
    end

    def weather_id
      @attributes[:weather].first[:id]
    end

    def weather_name
      @attributes[:weather].first[:main]
    end

    def weather_description
      @attributes[:weather].first[:description]
    end

    def temperature
      @attributes[:main][:temp]
    end

    def humidity
      @attributes[:main][:humidity]
    end

    def pressure
      @attributes[:main][:pressure]
    end

    def timestamp
      @attributes[:dt]
    end

    def timestamp_string
      @attributes[:dt_text]
    end

  end
end
