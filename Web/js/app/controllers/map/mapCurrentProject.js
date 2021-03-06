$(document).ready(function() {
    var params = {
        "dataUrl": "map/listCurrentProject",
        "properties": {
            "facility_obj": {
                "objectLatPropName": "facility_lat",
                "objectLngPropName": "facility_long",
                "objectNamePropName": "facility_name",
                "objectIdPropName": "facility_id"
            },
            "project_obj": {
                "objectActivePropName": "project_active"
            }
        }
    };
    if ($("#map").length) {
        setTimeout(function() {
            map = new GMaps({
                div: '#map',
                lat: 0,
                lng: 0,
                zoom: 14
            });
            load(params);
        }, 1000);
    }
});
