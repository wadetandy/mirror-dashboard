import Ember from 'ember';

export default Ember.Route.extend({
    model() {
        var weather = this.store.queryRecord('weather', {})
            .then(function(result){
                console.log(result);
                return result;
            })
        return Ember.RSVP.hash({
            weather: weather,
        })
    }
});