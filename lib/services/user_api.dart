import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api_call/model/user.dart';
import 'package:rest_api_call/model/user_dob.dart';
import 'package:rest_api_call/model/user_location.dart';
import 'package:rest_api_call/model/user_name.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    // print("Fetch Users Called");
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      final date = e['dob']['date'];
      final dob = UserDob(date: DateTime.parse(date), age: e['dob']['age']);

      final street = LocationStreet(
          name: e['location']['street']['name'],
          number: e['location']['street']['number']);

      final coordinates = LocationCoordinate(
        longitude: e['location']['coordinate']['longitude'],
        latitude: e['location']['coordinate']['latitude'],
      );

      final timezone = LocationTimezone(
          offset: e['location']['timezone']['offset'],
          description: e['location']['timezone']['description']);
      final location = UserLocation(
        city: e['location']['city'],
        state: e['location']['state'],
        country: e['location']['country'],
        // some post code are also string
        postcode: e['location']['postcode'].toString(),
        street: street,
        coordinates: coordinates,
        timezone: timezone,
      );
      return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
        dob: dob,
        location: location,
      );
    }).toList();
    // print('Fetch user called completed');
    return users;
  }
}