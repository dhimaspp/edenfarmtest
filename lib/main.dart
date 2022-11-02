import 'package:eden_farm_test/src/core/services/firebase_auth_services.dart';
import 'package:eden_farm_test/src/views/login/auth_validation.dart';
import 'package:eden_farm_test/src/views/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirebaseAuthService>(
      create: (context) =>
          FirebaseAuthService(authService: FirebaseAuth.instance),
      child: GetMaterialApp(
        title: 'EdenFarm Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthValidation(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
