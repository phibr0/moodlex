import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SettingsPage extends StatelessWidget {
  TextEditingController dateFmtController;
  SettingsPage() {
    dateFmtController = TextEditingController(
        text: storage.read('dateFmt') ?? 'dd.MM.yy hh:mm');
  }
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
            title: Text('Custom Date Formatting'),
            subtitle: Text('Default is: "dd.MM.yy hh:mm"'),
            trailing: SizedBox(
              child: TextField(
                controller: dateFmtController,
                onChanged: (value) => value.isNotEmpty
                    ? storage.write('dateFmt', value)
                    : storage.write('dateFmt', null),
              ),
              width: 140,
            ),
          )
        ],
      ),
    );
  }
}
