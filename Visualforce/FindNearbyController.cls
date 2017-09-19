public with sharing class FindNearbyController {
    public List<Map<String,Double>> locations { get; private set; }
    public String currentPosition {
        get {
            if (String.isBlank(currentPosition)) {
                currentPosition = '37.77493,-122.419416'; // San Francisco
}
            return currentPosition;
        }
set; }
    public Boolean resultsAvailable {
        get {
            if(locations == Null) {
                return false;
}
            return true;
        }
    }
    public PageReference findNearby() {
        String lat, lon;
        // FRAGILE: You'll want a better lat/long parsing routine
        // Format: "<latitude>,<longitude>" (must have comma, but only one comma)
        List<String> latlon = currentPosition.split(',');
        lat = latlon[0].trim();
        lon = latlon[1].trim();
        // SOQL query to get the nearest warehouses
        String queryString =
           'SELECT Id, Name, Location__longitude__s, Location__latitude__s ' +
           'FROM Warehouse__c ' +
           'WHERE DISTANCE(Location__c, GEOLOCATION('+lat+','+lon+'), \'mi\') < 20 ' +
           'ORDER BY DISTANCE(Location__c, GEOLOCATION('+lat+','+lon+'), \'mi\') ' +
           'LIMIT 10';
        // Run the query
        List <Warehouse__c> warehouses = database.Query(queryString);
        if(0 < warehouses.size()) {
            // Convert to locations that can be mapped
            locations = new List<Map<String,Double>>();
            for (Warehouse__c wh : warehouses) {
                locations.add(
                    new Map<String,Double>{
                    'latitude' => wh.Location__latitude__s,
    'longitude' => wh.Location__longitude__s
}
            System.debug('No results. Query: ' + queryString);
        }
        return null;
    }
}
