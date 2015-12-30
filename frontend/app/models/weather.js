import DS from 'ember-data';
import Ember from 'ember';

export default DS.Model.extend({
    location: DS.attr(),
    current:  DS.attr(),
    forecast: DS.attr(),
    toJSON: Ember.computed('location', 'forecast', 'current', function() {
        return JSON.stringify(this._internalModel._data)
    })
});
