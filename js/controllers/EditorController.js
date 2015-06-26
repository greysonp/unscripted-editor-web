app.controller('EditorController', ['$rootScope', '$scope', 'revisions', function($rootScope, $scope, revisions) {
    $scope.revision = {};
    $rootScope.$on('revisionSelected', function(event, data) {
        $scope.revision = data.revision;
    });
}]);