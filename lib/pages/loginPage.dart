import 'package:app/api/moodle.dart';
import 'package:app/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _userPassword = TextEditingController();
  final TextEditingController _rootUrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
          child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.grey,
            )
          ],
          color: Get.theme.backgroundColor,
        ),
        height: Get.mediaQuery.size.height / 2,
        width: Get.mediaQuery.size.width / 4 * 3,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: _userName,
                decoration: InputDecoration(
                  helperText: 'Username',
                ),
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _userPassword,
                obscureText: true,
                decoration: InputDecoration(
                  helperText: 'Password',
                ),
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
              TextFormField(
                validator: (input) {
                  if (!input.startsWith('http') || input.endsWith('/')) {
                    return 'Invalid URL';
                  }
                  return null;
                },
                controller: _rootUrl,
                decoration: InputDecoration(
                  helperText: 'Root Url',
                  hintText: 'https://...',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        String token = await getToken(
                            _userName.text, _userPassword.text, _rootUrl.text);
                        if (token != null) {
                          storage.write('token', token);
                          storage.write('root', _rootUrl.text);
                          Get.off(HomePage());
                          Get.showSnackbar(
                            GetBar(
                              duration: Duration(seconds: 2),
                              message: 'Logged in',
                            ),
                          );
                        } else {
                          Get.showSnackbar(
                            GetBar(
                              duration: Duration(seconds: 2),
                              message:
                                  'Error, maybe your credentials are incorrect',
                            ),
                          );
                        }
                      }
                    },
                    child: Text('Login'),
                  ),
                  OutlinedButton(
                    child: Text('Clear'),
                    onPressed: () {
                      _userName.clear();
                      _userPassword.clear();
                      _rootUrl.clear();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
