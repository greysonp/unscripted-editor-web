app.directive('unsRevision', function() {
    return {
        restrict: 'E',
        scope: {
            info: '=',
            clickListener: '&clickListener'
        },
        templateUrl: 'views/unsRevision.html'
    }
})