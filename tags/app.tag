<app>

    <div class="pane left">
        <revision each={revision in revisions} revision={ revision } onclick={ parent.onRevisionSelected } ></revision>
    </div>
    <div class="pane center">
        <div id="editor"></div>
    </div>
    <div class="pane right">
        <div>3</div>
    </div>


    <script>
        this.onRevisionSelected = function(e) {
            var revision = e.item.revision;
            getEditor().innerHTML = revisionPartsToHtml(revision.parts);
            addEditorListeners();
        }

        function revisionPartsToHtml(parts) {
            var output = '';
            for (var i = 0; i < parts.length; i++) {
                var node = parts[i];
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

        function getEditor() {
            return document.getElementById('editor');
        }

        function addEditorListeners() {
            var editor = getEditor();
            var options = editor.getElementsByClassName('option');
            for (var i = 0; i < options.length; i++) {
                options[i].addEventListener('click', function() {
                    console.log('option');
                });
            }
        }
    </script>

</app>