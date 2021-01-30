import 'package:app/pages/devPage.dart';
import 'package:app/pages/settingsPage.dart';
import 'package:app/widgets/allCoursesList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logineo'),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Get.to(DevPage());
                    },
                    child: Text('Developer Settings'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Get.to(SettingsPage());
                    },
                    child: Text('Settings'),
                  )
                ],
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
      body: AllCoursesList(),
    );
  }
}
