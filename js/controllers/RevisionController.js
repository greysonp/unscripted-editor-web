app.controller('RevisionController', ['$rootScope', '$scope', 'revisions', function($rootScope, $scope, revisions) {
    $scope.revisions = revisions;

    $scope.revisionClick = function(revision) {
        $rootScope.$emit('revisionSelected', revision);
    }
}]);