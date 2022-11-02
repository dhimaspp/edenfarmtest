import 'package:eden_farm_test/src/core/bloc/profile_controller.dart';
import 'package:eden_farm_test/src/core/model/profile_model.dart';
import 'package:eden_farm_test/src/shared/theme_constant.dart';
import 'package:eden_farm_test/src/views/login/login_page.dart';
import 'package:eden_farm_test/src/views/profile/detail_profil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController pc = Get.put(ProfileController());
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return FutureBuilder(
              future: pc.getProfil(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Container();
                } else if (snapshot.hasData) {
                  return Scaffold(
                    body: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            color: kMaincolor,
                            height: 190,
                            padding: const EdgeInsets.only(top: 60, left: 20),
                            width: Get.width,
                            child: Text(
                              'Akun',
                              style: textInputDecoration.labelStyle!.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Positioned(
                            top: 110,
                            child: Container(
                                // height: 40,
                                height: MediaQuery.of(context).size.height,
                                width: Get.width,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        topLeft: Radius.circular(30))),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      CircleAvatar(
                                        radius: 55,
                                        backgroundColor: kMaincolor,
                                        child: Text(
                                          snapshot.data!.name == null
                                              ? 'E'
                                              : snapshot.data!.name![0]
                                                      .capitalize ??
                                                  'E',
                                          // 'K',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 80),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        child: Text(
                                          snapshot.data!.name == null
                                              ? 'No Name'
                                              : snapshot.data!.name!
                                                      .capitalizeFirst ??
                                                  'No Name',
                                          style: const TextStyle(
                                              color: kMaincolor, fontSize: 24),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(const DetailAccount());
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              top: 30, bottom: 15),
                                          height: 72,
                                          width: Get.width / 1.15,
                                          decoration: BoxDecoration(
                                            color: kFillColor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 18),
                                                      height: 46,
                                                      child: Image.asset(
                                                          'assets/accounts/icon-info-detail-rounded.png')),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: const [
                                                        Text(
                                                          'Profil',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Text(
                                                          'Detail Profil Anda',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 14),
                                                child: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: Colors.grey,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controller.userLogout();
                                          Get.to(const LoginScreen());
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 15),
                                          height: 72,
                                          width: Get.width / 1.15,
                                          decoration: BoxDecoration(
                                            color: Colors.red.shade50,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 18),
                                                      height: 46,
                                                      child: Image.asset(
                                                          'assets/accounts/icon-logout-rounded.png')),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: const [
                                                        Text(
                                                          'Keluar',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Text(
                                                          'Keluar dari Akun Anda',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 14),
                                                child: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: Colors.grey,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ])),
                          ),
                          // Container(
                          //   color: kMaincolor,
                          //   height: 120,
                          // ),
                        ],
                      ),
                    ),
                  );
                } else {
                  EasyLoading.show();
                  return Container();
                }
              });
        });
  }
}
