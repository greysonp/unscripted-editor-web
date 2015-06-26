app.filter('revisionToHtml', function() {
    return function(revision) {
        var output = '';
        for (var i = 0; i < revision.length; i++) {
            var node = revision[i];
            if (node.type === 'text') {
                output += parseTextNode(node);
            } else if (node.type === 'option') {
                output += parseOptionNode(node);
            } else {
                console.warn('Encountered node with unknown type: ' + node.type);
            }
        }

        return output;

        function parseTextNode(node) {
            return '<span>' + node.text + '</span>';
        }

        function parseOptionNode(node) {
            return '<span class="option">' + node.options[0].text + '</span>';
        }
    }
});