import DS from 'ember-data';

export default DS.Model.extend({
    weather_id: DS.attr(),
    weather_name: DS.attr(),
    weather_description: DS.attr(),
    temperature: DS.attr(),
    humidity: DS.attr(),
    pressure: DS.attr(),
    timestamp: DS.attr('date')
});
