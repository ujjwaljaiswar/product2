import 'dart:convert';
import 'package:product2/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<User> users = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("post method "),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {

            final id = users[index];
            final message = id.message;
            final name = id.name;

            return ListTile(
              leading: Text(message),
              subtitle: Text(name),
            );
          }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: PostData(),

      ),
    );
  }


  PostData()  {

    print("hello");

    Map data = {
      'mobile_number':'1111111111',
      'password':'11111',

    };

    const url = 'https://virashtechnologies.com/test-virash/login.php';
    final uri = Uri.parse(url);
    http.post(uri, body: data).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final parsedResponse = json.decode(response.body);

        if (parsedResponse is List) {
          final usersList = parsedResponse.map((data) => User.fromJson(data)).toList();

          setState(() {
            users = usersList;
          });
        }
      }
    });

    print("END");
  }

}
