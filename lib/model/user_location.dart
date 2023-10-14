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

  factory UserLocation.fromMap(Map<String,dynamic> json){
    final street = LocationStreet(
          name: json['street']['name'],
          number: json['street']['number']);

      final coordinates = LocationCoordinate(
        longitude: json['coordinate']['longitude'],
        latitude: json['coordinate']['latitude'],
      );

      final timezone = LocationTimezone(
        offset: json['timezone']['offset'],
        description: json['timezone']['description'],
      );

     return UserLocation(
        city: json['city'],
        state: json['state'],
        country: json['country'],
        // some post code are also string
        postcode: json['postcode'].toString(),
        street: street,
        coordinates: coordinates,
        timezone: timezone,
      );
  }
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
