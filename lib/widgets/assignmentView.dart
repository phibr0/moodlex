import 'package:app/data/classes.dart';
import 'package:app/widgets/attachmentContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get_storage/get_storage.dart';

import '../commonFunctions.dart';

class AssignmentView extends StatelessWidget {
  final Assignment assignment;
  AssignmentView(this.assignment);
  var storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(assignment.name),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Scrollbar(
              child: Markdown(
                selectable: true,
                imageBuilder: (uri, title, alt) {
                  return Container();
                },
                data: getMdFromHtml(assignment.intro),
              ),
            ),
          ),
          Expanded(
            child: AttachmentContainer(assignment.introattachments),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
