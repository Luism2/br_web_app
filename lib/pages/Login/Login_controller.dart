import 'package:flutter/material.dart';
import 'package:br_web_app/pages/models/users.dart';
import 'package:br_web_app/pages/models/response_api.dart';
import 'package:br_web_app/pages/colors/shared_preferences.dart';
import 'package:br_web_app/pages/provider/users_provider.dart';

class LoginController {
  BuildContext? context;
  TextEditingController userCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future init(BuildContext context) async {
    User user = User.fromJson(await sharedPref.read('user') ?? {});

    print('User Session Token: ${user.sessionToken}');

    // ignore_for_file: use_build_context_synchronously
    if (user.sessionToken != null) {
      print('USER LOGGED IN: ${user.toJson()}');
      if (user.roles.length > 1) {
        Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, user.roles[0]!.route, (route) => false);
      }
    }
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'register');
  }

  void login() async {
    String userCode = userCodeController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi? responseApi = await usersProvider.login(userCode, password);

    print('Respuesta object: $responseApi');

    if (responseApi?.success == true) {
      User user = User.fromJson(responseApi?.data);
      sharedPref.save('user',
          user.toJson()); // Se almacena el usuario dentro del dispositivo

      print('USER LOGGED IN: ${user.toJson()}');
      if (user.roles.length > 1) {
        Navigator.pushNamedAndRemoveUntil(context!, 'roles', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context!, user.roles[0]!.route, (route) => false);
      }
    } else {
      MySnackBar.show(context!, '${responseApi?.message}');
    }
  }
}
