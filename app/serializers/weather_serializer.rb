class WeatherSerializer < ActiveModel::Serializer
  attributes :location
  has_one :current, serializer: WeatherSnapshotSerializer
  has_many :forecast, serializer: WeatherSnapshotSerializer
end