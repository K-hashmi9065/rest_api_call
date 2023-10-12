import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_call/model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rest API call'),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final color = user.gender == 'male' ? Colors.blue : Colors.green;
            return ListTile(
              title: Text(user.email),
              subtitle: Text(user.phone),
              tileColor: color,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchUsers,
        ));
  }

  void fetchUsers() async {
    //print("Fetch Users Called");
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    final transformed = results.map((e) {
      final name = UserName(
        title: e['user']['title'],
        first: e['user']['first'],
        last: e['user']['title'],
      );
      return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
      );
    }).toList();
    setState(() {
      users = transformed;
    });
    //print('Fetch users Completed');
  }
}
