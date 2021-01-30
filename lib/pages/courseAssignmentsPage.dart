import 'package:app/commonFunctions.dart';
import 'package:app/data/classes.dart';
import 'package:app/widgets/assignmentView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseAssignmentsPage extends StatelessWidget {
  final Course course;

  CourseAssignmentsPage(this.course);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.fullname),
      ),
      body: ListView.builder(
        itemCount: course.assignments.length,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: Text(
              getFormattedDate(course.assignments[index].duedate),
            ),
            title: Text(course.assignments[index].name),
            onTap: () => Get.to(
              AssignmentView(
                course.assignments[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
