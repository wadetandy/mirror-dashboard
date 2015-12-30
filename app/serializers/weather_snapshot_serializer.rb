class WeatherSnapshotSerializer < ActiveModel::Serializer
  attributes :temperature, :pressure, :humidity, :weather_id, :weather_name, :weather_description, :timestamp, :timestamp_string

  def temperature
    k_to_f(object.temperature)
  end

  private

  def k_to_f(kelvin)
    (kelvin - 273.15) * 1.8000 + 32.00
  end
end