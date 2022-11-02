// ignore_for_file: prefer_final_fields

import 'package:eden_farm_test/src/core/bloc/profile_controller.dart';
import 'package:eden_farm_test/src/shared/input_formater.dart';
import 'package:eden_farm_test/src/shared/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetailAccount extends GetView<ProfileController> {
  const DetailAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Obx(() {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                color: kMaincolor,
                height: 190,
                padding: const EdgeInsets.only(top: 60, left: 62),
                width: Get.width,
                child: Text(
                  'Detail Profil',
                  style: textInputDecoration.labelStyle!.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                height: 30,
                margin: const EdgeInsets.only(
                  top: 52,
                  left: 12,
                ),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 110,
                child: Container(
                    width: Get.width,
                    height: Get.height,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: SingleChildScrollView(
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
                                controller.nama.toString().isEmpty
                                    ? 'E'
                                    : controller.nama
                                        .toString()[0]
                                        .capitalizeFirst!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 80),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 30, bottom: 15),
                              height: Get.height,
                              width: Get.width / 1.15,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Nama',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: Colors.grey,
                                    ))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.nama.toString().isEmpty
                                              ? 'No Name'
                                              : controller.nama
                                                  .toString()
                                                  .capitalizeFirst!,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              controller.successUbahNama.value =
                                                  false;
                                              controller.ubahNama.value = true;
                                            },
                                            child: const Text('Ubah',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: kMaincolor,
                                                    fontWeight:
                                                        FontWeight.w400)))
                                      ],
                                    ),
                                  ),
                                  controller.successUbahNama.value == true
                                      ? const Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: Text(
                                            "Berhasil mengubah nama!",
                                            style: TextStyle(color: kMaincolor),
                                          ),
                                        )
                                      : const SizedBox(),
                                  AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      transitionBuilder: (Widget child,
                                          Animation<double> animation) {
                                        final offsetAnimation = Tween<Offset>(
                                                begin: const Offset(1.0, 0.0),
                                                end: const Offset(0.0, 0.0))
                                            .animate(animation);
                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                      child: controller.ubahNama.value == true
                                          ? Container(
                                              padding: const EdgeInsets.all(8),
                                              // height: 60,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  TextFormField(
                                                    controller: controller
                                                        .namaController.value,
                                                    validator: (val) {
                                                      if (val ==
                                                          controller
                                                              .namaController
                                                              .value
                                                              .text) {
                                                        return 'Nama baru sama dengan nama anda sebelumnya';
                                                      } else if (val!.isEmpty) {
                                                        return 'Masukan nama baru';
                                                      }
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                'Masukan nama baru',
                                                            // border: InputBorder.none,
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5.0)),
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            kMaincolor))),
                                                  ),
                                                  Row(
                                                    children: [
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      kMaincolor),
                                                          onPressed: () {
                                                            controller
                                                                .loadingUbahNama
                                                                .value = true;

                                                            controller
                                                                .ubahNamaService({
                                                              'name': controller
                                                                  .namaController
                                                                  .value
                                                                  .text
                                                            });

                                                            controller
                                                                .getProfil();
                                                            controller.nama
                                                                    .value =
                                                                controller
                                                                    .namaController
                                                                    .value
                                                                    .text;
                                                            controller
                                                                .successUbahNama
                                                                .value = true;
                                                            controller.ubahNama
                                                                .value = false;
                                                            controller
                                                                .loadingUbahNama
                                                                .value = false;
                                                          },
                                                          child: const Text(
                                                            'Perbarui Nama',
                                                          )),
                                                      TextButton(
                                                          onPressed: () {
                                                            controller.ubahNama
                                                                .value = false;
                                                          },
                                                          child: const Text(
                                                            'batalkan',
                                                            style: TextStyle(
                                                                color:
                                                                    kMaincolor),
                                                          )),
                                                      controller.loadingUbahNama
                                                                  .value ==
                                                              true
                                                          ? const CircularProgressIndicator(
                                                              color: kMaincolor,
                                                            )
                                                          : const SizedBox(
                                                              height: 0,
                                                            )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          : const SizedBox(
                                              height: 25,
                                            )),
                                  const Text(
                                    'Gender',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: Colors.grey,
                                    ))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.gender.value,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              controller.successUbahGender
                                                  .value = false;
                                              controller.ubahGender.value =
                                                  true;
                                            },
                                            child: const Text('Ubah',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: kMaincolor,
                                                    fontWeight:
                                                        FontWeight.w400)))
                                      ],
                                    ),
                                  ),
                                  controller.successUbahGender.value == true
                                      ? const Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: Text(
                                            "Berhasil mengubah emal!",
                                            style: TextStyle(color: kMaincolor),
                                          ),
                                        )
                                      : const SizedBox(),
                                  AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      transitionBuilder: (Widget child,
                                          Animation<double> animation) {
                                        final offsetAnimation = Tween<Offset>(
                                                begin: const Offset(1.0, 0.0),
                                                end: const Offset(0.0, 0.0))
                                            .animate(animation);
                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                      child: controller.ubahGender.value == true
                                          ? Container(
                                              padding: const EdgeInsets.all(8),
                                              // height: 60,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  DropdownButton(
                                                      items: List.generate(
                                                          controller.genderItem
                                                              .length,
                                                          (index) =>
                                                              DropdownMenuItem(
                                                                  onTap: () {
                                                                    controller
                                                                        .selectedGender
                                                                        .value = controller
                                                                            .genderItem[
                                                                        index];
                                                                  },
                                                                  child: Text(controller
                                                                          .genderItem[
                                                                      index]))),
                                                      onChanged: (d) {
                                                        debugPrint(d);
                                                      }),
                                                  Row(
                                                    children: [
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      kMaincolor),
                                                          onPressed: () {
                                                            // controller
                                                            //     .loadingUbahGender
                                                            //     .value = true;

                                                            // _authmanager
                                                            //     .userGantiEmail(
                                                            //         emailController
                                                            //             .text);

                                                            // controller.gender =
                                                            //     controller
                                                            //         .selectedGender;
                                                            // controller
                                                            //     .successUbahGender
                                                            //     .value = true;
                                                            // controller
                                                            //     .ubahGender
                                                            //     .value = false;
                                                            // controller
                                                            //     .loadingUbahGender
                                                            //     .value = false;
                                                          },
                                                          child: const Text(
                                                            'Perbarui Email',
                                                          )),
                                                      TextButton(
                                                          onPressed: () {
                                                            controller
                                                                .ubahGender
                                                                .value = false;
                                                          },
                                                          child: const Text(
                                                            'batalkan',
                                                            style: TextStyle(
                                                                color:
                                                                    kMaincolor),
                                                          )),
                                                      controller.loadingUbahGender
                                                                  .value ==
                                                              true
                                                          ? const CircularProgressIndicator(
                                                              color: kMaincolor,
                                                            )
                                                          : const SizedBox(
                                                              height: 0,
                                                            )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          : const SizedBox(
                                              height: 25,
                                            )),
                                  const Text(
                                    'Tanggal Lahir',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: Colors.grey,
                                    ))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.nama.toString().isEmpty
                                              ? '-'
                                              : controller.nama
                                                  .toString()
                                                  .capitalizeFirst!,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              controller.successUbahNama.value =
                                                  false;
                                              controller.ubahNama.value = true;
                                            },
                                            child: const Text('Ubah',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: kMaincolor,
                                                    fontWeight:
                                                        FontWeight.w400)))
                                      ],
                                    ),
                                  ),
                                  controller.successUbahNama.value == true
                                      ? const Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: Text(
                                            "Berhasil mengubah nama!",
                                            style: TextStyle(color: kMaincolor),
                                          ),
                                        )
                                      : const SizedBox(),
                                  AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      transitionBuilder: (Widget child,
                                          Animation<double> animation) {
                                        final offsetAnimation = Tween<Offset>(
                                                begin: const Offset(1.0, 0.0),
                                                end: const Offset(0.0, 0.0))
                                            .animate(animation);
                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                      child: controller.ubahNama.value == true
                                          ? Container(
                                              padding: const EdgeInsets.all(8),
                                              // height: 60,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  TextFormField(
                                                    controller: controller
                                                        .namaController.value,
                                                    validator: (val) {
                                                      if (val ==
                                                          controller
                                                              .namaController
                                                              .value
                                                              .text) {
                                                        return 'Nama baru sama dengan nama anda sebelumnya';
                                                      } else if (val!.isEmpty) {
                                                        return 'Masukan nama baru';
                                                      }
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                'Masukan nama baru',
                                                            // border: InputBorder.none,
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5.0)),
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            kMaincolor))),
                                                  ),
                                                  Row(
                                                    children: [
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      kMaincolor),
                                                          onPressed: () {
                                                            controller
                                                                .loadingUbahNama
                                                                .value = true;

                                                            controller
                                                                .ubahNamaService({
                                                              'name': controller
                                                                  .loadingUbahNama
                                                                  .value
                                                            });

                                                            controller
                                                                .getProfil();
                                                            controller
                                                                .successUbahNama
                                                                .value = true;
                                                            controller.ubahNama
                                                                .value = false;
                                                            controller
                                                                .loadingUbahNama
                                                                .value = false;
                                                          },
                                                          child: const Text(
                                                            'Perbarui Nama',
                                                          )),
                                                      TextButton(
                                                          onPressed: () {
                                                            controller.ubahNama
                                                                .value = false;
                                                          },
                                                          child: const Text(
                                                            'batalkan',
                                                            style: TextStyle(
                                                                color:
                                                                    kMaincolor),
                                                          )),
                                                      controller.loadingUbahNama
                                                                  .value ==
                                                              true
                                                          ? const CircularProgressIndicator(
                                                              color: kMaincolor,
                                                            )
                                                          : const SizedBox(
                                                              height: 0,
                                                            )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          : const SizedBox(
                                              height: 25,
                                            )),
                                  const Text(
                                    'Tinggi (cm)',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: Colors.grey,
                                    ))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.nama.toString().isEmpty
                                              ? '-'
                                              : controller.nama
                                                  .toString()
                                                  .capitalizeFirst!,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              controller.successUbahNama.value =
                                                  false;
                                              controller.ubahNama.value = true;
                                            },
                                            child: const Text('Ubah',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: kMaincolor,
                                                    fontWeight:
                                                        FontWeight.w400)))
                                      ],
                                    ),
                                  ),
                                  controller.successUbahNama.value == true
                                      ? const Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: Text(
                                            "Berhasil mengubah nama!",
                                            style: TextStyle(color: kMaincolor),
                                          ),
                                        )
                                      : const SizedBox(),
                                  AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      transitionBuilder: (Widget child,
                                          Animation<double> animation) {
                                        final offsetAnimation = Tween<Offset>(
                                                begin: const Offset(1.0, 0.0),
                                                end: const Offset(0.0, 0.0))
                                            .animate(animation);
                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                      child: controller.ubahNama.value == true
                                          ? Container(
                                              padding: const EdgeInsets.all(8),
                                              // height: 60,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  TextFormField(
                                                    controller: controller
                                                        .namaController.value,
                                                    validator: (val) {
                                                      if (val ==
                                                          controller
                                                              .namaController
                                                              .value
                                                              .text) {
                                                        return 'Nama baru sama dengan nama anda sebelumnya';
                                                      } else if (val!.isEmpty) {
                                                        return 'Masukan nama baru';
                                                      }
                                                    },
                                                    inputFormatters: [
                                                      CustomSeparatorForm(
                                                          decimalDigits: 0)
                                                    ],
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                'Masukan nama baru',
                                                            // border: InputBorder.none,
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5.0)),
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            kMaincolor))),
                                                  ),
                                                  Row(
                                                    children: [
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      kMaincolor),
                                                          onPressed: () {
                                                            controller
                                                                .loadingUbahNama
                                                                .value = true;

                                                            controller
                                                                .ubahNamaService({
                                                              'name': controller
                                                                  .loadingUbahNama
                                                                  .value
                                                            });

                                                            controller
                                                                .getProfil();
                                                            controller
                                                                .successUbahNama
                                                                .value = true;
                                                            controller.ubahNama
                                                                .value = false;
                                                            controller
                                                                .loadingUbahNama
                                                                .value = false;
                                                          },
                                                          child: const Text(
                                                            'Perbarui Nama',
                                                          )),
                                                      TextButton(
                                                          onPressed: () {
                                                            controller.ubahNama
                                                                .value = false;
                                                          },
                                                          child: const Text(
                                                            'batalkan',
                                                            style: TextStyle(
                                                                color:
                                                                    kMaincolor),
                                                          )),
                                                      controller.loadingUbahNama
                                                                  .value ==
                                                              true
                                                          ? const CircularProgressIndicator(
                                                              color: kMaincolor,
                                                            )
                                                          : const SizedBox(
                                                              height: 0,
                                                            )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          : const SizedBox(
                                              height: 25,
                                            )),
                                ],
                              ),
                            ),
                          ]),
                    )),
              ),
              // Container(
              //   color: kMaincolor,
              //   height: 120,
              // ),
            ],
          ),
        );
      }),
    );
    ;
  }
}
