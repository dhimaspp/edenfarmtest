import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eden_farm_test/src/core/model/profile_model.dart';
import 'package:eden_farm_test/src/core/services/service_firestore_repository.dart';
import 'package:eden_farm_test/src/views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  late final ServiceFireStoreRepository _serviceFireStoreRepository;
  var namaController = TextEditingController().obs;
  var dController = TextEditingController().obs;
  var dateBirthController = TextEditingController().obs;
  var heightController = TextEditingController().obs;
  var ubahNama = false.obs,
      ubahGender = false.obs,
      ubahDateBirth = false.obs,
      ubahHeight = false.obs;
  var loadingUbahNama = false.obs,
      loadingUbahGender = false.obs,
      loadingUbahDateBirth = false.obs,
      loadingUbahHeight = false.obs;
  var successUbahNama = false.obs,
      successUbahGender = false.obs,
      successUbahDateBirth = false.obs,
      successUbahHeight = false.obs;

  var nama = ''.obs,
      gender = ''.obs,
      selectedGender = ''.obs,
      genderItem = ['Laki-laki', 'Perempuan'].obs,
      height = ''.obs,
      dateBirth = ''.obs;
  final isLogged = false.obs;
  final berhasilGantiNama = false.obs;
  var profileModel = ProfileModel();

  @override
  void onInit() {
    super.onInit();
    _serviceFireStoreRepository = ServiceFireStoreRepository();
  }

  Future<dynamic> getProfil() async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc('userId')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  Future<ProfileModel> ubahNamaService(Map<String, dynamic> body) {
    return _serviceFireStoreRepository.request(
        collection: 'profile',
        model: ProfileModel(),
        method: QueryMethods.update,
        body: body);
  }

  Future<ProfileModel> ubahGenderService(Map<String, dynamic> body) {
    return _serviceFireStoreRepository.request(
        collection: 'profile',
        model: ProfileModel(),
        method: QueryMethods.update,
        body: body);
  }

  Future<void> userLogout() async {
    isLogged.value = false;
    final localStorage = GetStorage();
    await localStorage.remove('isLogged');
    debugPrint('logout success');
  }
}
