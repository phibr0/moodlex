import 'package:app/controller/userDataController.dart';
import 'package:app/pages/courseAssignmentsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCoursesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDataController>(
      // specify type as Controller
      init: UserDataController(), // intialize with the Controller
      builder: (userDataController) => ListView.builder(
        itemCount: userDataController.userData.value.courses?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => Get.to(
              CourseAssignmentsPage(
                  userDataController.userData.value.courses[index]),
            ),
            title: Text(
              userDataController.userData.value.courses[index].fullname,
            ),
          );
        },
      ),
    );
  }
}
