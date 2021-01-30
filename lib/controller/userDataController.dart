import 'package:app/data/classes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../api/moodle.dart';

class UserDataController extends GetxController {
  var userData = UserData().obs;
  final storage = GetStorage();

  @override
  void onInit() {
    fetchUserData(storage.read('token'), storage.read('root'));
    super.onInit();
  }

  void fetchUserData(String token, String root) async {
    var newUserData = await MoodleServices.fetchUserData(token, root);

    if (newUserData != null) {
      userData.value = newUserData;
      update();
    }
  }
}
