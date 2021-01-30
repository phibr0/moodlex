import 'package:app/pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DevPage extends StatelessWidget {
  final storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Reset your Token'),
            subtitle: Text('Your current token: ' + storage.read('token')),
            trailing: OutlinedButton(
              child: Text('Reset'),
              onPressed: () => storage.remove('token'),
            ),
          ),
          ListTile(
            title: Text('View Login Page'),
            trailing: OutlinedButton(
              child: Text('Login Page'),
              onPressed: () => Get.to(LoginPage()),
            ),
          ),
        ],
      ),
    );
  }
}
