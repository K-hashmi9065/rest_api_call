class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinate coordinates;
  final LocationTimezone timezone;
  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
    required this.timezone,
  });
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({
    required this.name,
    required this.number,
  });
}

class LocationCoordinate {
  final String longitude;
  final String latitude;
  LocationCoordinate({
    required this.longitude,
    required this.latitude,
  });
}

class LocationTimezone {
  final String offset;
  final String description;
  LocationTimezone({
    required this.offset,
    required this.description,
  });
}
