app.controller('RevisionController', ['$rootScope', '$scope', 'revisions', function($rootScope, $scope, revisions) {
    $scope.revisions = revisions;

    $scope.revisionClick = function(title, revision) {
        $rootScope.$emit('revisionSelected', { 'title': title, 'revision': revision });
    }
}]);