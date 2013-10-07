<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BingMapPropertyEditor.ascx.cs" Inherits="UserControls_BingMapPropertyEditor" %>

<asp:TextBox runat="server" ID="txtLocation" />
<script charset="UTF-8" type="text/javascript" src="http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0">
</script>
<script>
    $(function () {
        var loc = document.getElementById("<%= txtLocation.ClientID %>").value;

        var mapOptions = {
            zoom: 8,
            credentials: '<%= BingKey %>'
        };

        if (loc !== '') {
            mapOptions.center = new Microsoft.Maps.Location(loc.split(',')[0], loc.split(',')[1]);
            mapOptions.zoom = parseInt(loc.split(',')[2]);           
        }

        map = new Microsoft.Maps.Map(document.getElementById('mapDiv'), mapOptions);
        // add default pin
        var pushpin = new Microsoft.Maps.Pushpin(mapOptions.center, {
            'draggable': true
        });
        map.entities.push(pushpin);

        var attachclick = Microsoft.Maps.Events.addHandler(map, 'click', function (e) {
            if (e.targetType == "map") {
                map.entities.clear();
                var point = new Microsoft.Maps.Point(e.getX(), e.getY());
                var loc = e.target.tryPixelToLocation(point);
                var location = new Microsoft.Maps.Location(loc.latitude, loc.longitude);
                var pushpin = new Microsoft.Maps.Pushpin(location, {
                    'draggable': true
                });
                map.entities.push(pushpin);
                document.getElementById("<%= txtLocation.ClientID %>").value = location.latitude + "," + location.longitude + "," + map.getTargetZoom();
          }
      });
    });
</script>

<div id='mapDiv' style="position:relative; width: <%= MapWidth %>; height: <%= MapHeight %>;">
</div>
