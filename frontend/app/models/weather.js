import DS from 'ember-data';
import Ember from 'ember';

export default DS.Model.extend({
    location: DS.attr(),
    current:  DS.belongsTo('weather-snapshot'),
    forecast: DS.hasMany('weather-snapshot'),
    toJSON: Ember.computed('location', 'forecast', 'current', function() {
        return JSON.stringify(this._internalModel._data)
    })
});
