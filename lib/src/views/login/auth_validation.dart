import 'package:eden_farm_test/src/shared/persistence_bottom_nav.dart';
import 'package:eden_farm_test/src/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AuthValidation extends StatelessWidget {
  const AuthValidation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storaging = GetStorage();
    if (storaging.read('isLogged') == null) {
      storaging.write('isLogged', false);
    }
    bool isLogged = storaging.read('isLogged');
    return isLogged == true
        ? const PersistenceBottomNavBar()
        : const LoginScreen();
  }
}
