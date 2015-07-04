<app>

    <div class="pane left">
        <revision each={revision in _revisions} revision={ revision } onclick={ parent.onRevisionSelected } ></revision>
    </div>
    <div class="pane center">
        <div id="editor" contenteditable></div>
    </div>
    <div class="pane right">
        <input type="file" id="file-input" onchange={ onFileOpen }/>
    </div>


    <script>
        // ====================================================================
        // Lifecycle
        // ====================================================================
        var _root = this;
        _root.on('mount', function() {
            showRevision(_revisions[0]);
        });

        // ====================================================================
        // Listeners
        // ====================================================================
        _root.onRevisionSelected = function(e) {
            showRevision(e.item.revision);
        };

        _root.onFileOpen = function(e) {
            var file = e.target.files[0];
            if (!file) {
                console.warn('File picker was given nothing.');
                return;
            }
            var reader = new FileReader();
            reader.onload = function(e) {
                var contents = e.target.result;
                try {
                    _revisions = JSON.parse(e.target.result);
                    _root.update();
                    showRevision(_revisions[0]);
                } catch (e) {
                    console.error('Imported file contained invalid JSON: ' + e);
                }
            };
            reader.readAsText(file);
        };


        // ====================================================================
        // Helpers
        // ====================================================================
        function showRevision(revision) {
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