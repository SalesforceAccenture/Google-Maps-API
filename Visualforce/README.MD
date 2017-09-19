# Visualforce Maps
* Visualforce maps are interactive, JavaScript-based maps, complete with zooming, panning, and markers based on your Salesforce or other data. 
* The `<apex:map>` component defines the map canvas, including size, type, center point, and initial zoom level. The `<apex:mapMarker>` child component defines the markers to place on the map by address or geolocation (latitude and longitude). You can use the `<apex:mapInfoWindow>` component to add customizable information panels that appear when a marker is clicked or tapped.
* Visualforce mapping components aren’t available in Developer Edition organizations.
* If your items to be mapped don’t have a latitude and longitude, Visualforce maps can geocode their addresses.
* Addresses that need geocoding—that is, locations that don’t include values for latitude and longitude—are sent to a third-party service for geocoding. These addresses aren’t associated with your organization, and no other data is sent other than what you provide in your Visualforce markup. However, if your organization requires strict control of data shared outside of Salesforce, don’t use the geocoding feature of Visualforce maps.
* The center attribute defines the point around which the map is centered. You can provide center values in several formats.
* A string that represents an address. For example, "1 Market Street, San Francisco, CA". The address is geocoded to determine its latitude and longitude.
* A string that represents a JSON object with latitude and longitude attributes that specify location coordinates. For example, `"{latitude: 37.794, longitude: -122.395}"`.
* An Apex map object of type `Map<String, Double>`, with latitude and longitude keys to specify location coordinates.
* To display up to 100 markers, add child <apex:mapMarker> components.
* The map’s center location value is provided as a street address, not a geolocation. The mapping service looks up the latitude and longitude for the address. This process is called geocoding. You can include up to 10 geocoded addresses to a map, either as center attributes or as markers added with `<apex:mapMarker>` components.
* The mapType value is “roadmap”, a standard street map. Other options are “satellite” and “hybrid”.
* You can have up to 10 geocoded address lookups per map. Lookups for both the center attribute of the <apex:map> component and the position attribute of the <apex:mapMarker> component count against this limit. To display more markers, provide position values that don’t require geocoding. Locations that exceed the geocoding limit are skipped.
