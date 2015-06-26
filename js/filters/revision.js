app.filter('revision', function() {
    return function(input) {
        return input.body;
    }
});