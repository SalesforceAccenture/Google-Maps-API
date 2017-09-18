global with sharing class FindNearbyClients {

    public FindNearbyClients(ApexPages.StandardSetController controller) { }
    @RemoteAction
    // Find clients nearest to the geolocation
    global static List<Account> getNearby(String lat, String lon) {

        // SOQL query to get the nearest Account
        String queryString =
        'SELECT Id, Name, Location_Longitude__s, Location_Latitude__s, ' +
          'Street_Address__c, Phone__c, City__c' +
        'FROM Acount ' +
        'WHERE DISTANCE(Location__c, GEOLOCATION('+lat+', '+lon+'), \'mi\')' +
        'LIMIT 10';

        // Run and return the query results
        return(database.Query(queryString));
    }
}
