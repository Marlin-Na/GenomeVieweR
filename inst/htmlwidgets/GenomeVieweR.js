
HTMLWidgets.widget({

    name: 'GenomeVieweR',

    type: 'output',

    factory: function(el, width, height) {

        // TODO: define shared variables for this instance

        return {

            renderValue: function(x) {
                // Initialize the dom
                var l_node = document.createElement("DIV");
                l_node.id = el.id + "_linear";
                el.appendChild(l_node);

                // Refer: https://bl.ocks.org/lairdm/c6c235dbfa6e6ee61565
                var linearlayout = {
                    genomesize: 6264404,
                    height: 250,
                    width: 900,
                    //container: "#linearchart",
                    container: "#" + l_node.id,
                    initStart: 0,
                    initEnd: 200000
                };

                var Get = function(url) {
                    var Httpreq = new XMLHttpRequest();
                    Httpreq.open("GET", url, false);
                    Httpreq.send(null);
                    return Httpreq.responseText;          
                };

                // var tracks = x.tracks;

                var linearTrack = new genomeTrack(linearlayout, tracks);

                // Callbacks
                var linearPopup = function(trackName, d) {
                    alert("Received click event from track" + trackName +
                          ", item: " + JSON.stringify(d));
                };
                var linearClick = function(trackName, d) {
                    window.open("https://github.com/lairdm/islandplot", '_blank');
                };

                return;
            },

            resize: function(width, height) {

                // TODO: code to re-render the widget with a new size

            }

        };
    }
});

