import 'package:app/commonFunctions.dart';
import 'package:app/data/classes.dart';
import 'package:flutter/material.dart';

class AttachmentContainer extends StatelessWidget {
  List<Introattachment> attachments;
  AttachmentContainer(this.attachments);
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Attachment(
              attachments[index].filename, attachments[index].fileurl);
        },
        itemCount: attachments.length,
      ),
    );
  }
}

class Attachment extends StatelessWidget {
  final String filename;
  final String fileUrl;
  Attachment(this.filename, this.fileUrl);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () => launchUrlWithToken(fileUrl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Icon(Icons.insert_drive_file), Text(filename)],
        ),
      ),
    );
  }
}
