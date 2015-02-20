$(document).ready(function() {
    var params = {
        "dataUrl": "map/listCurrentProjectLocations",
        "properties": {
            "location_obj": {
                "objectLatPropName": "location_lat",
                "objectLngPropName": "location_long",
                "objectActivePropName": "location_active"
            },
            "defaultLocation": {
                "object": "facility_obj",
                "objectLatPropName": "facility_lat",
                "objectLngPropName": "facility_long"
            }
        }
    };
    if ($("#map").length) {
        setTimeout(function() {
            map = new GMaps({
                div: '#map',
                lat: 0,
                lng: 0,
                zoom: 15
            });
            load(params);
        }, 1000);
    }
});