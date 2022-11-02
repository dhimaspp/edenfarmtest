import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:eden_farm_test/src/core/bloc/profile_controller.dart';
import 'package:eden_farm_test/src/shared/theme_constant.dart';
import 'package:eden_farm_test/src/views/home/home.dart';
import 'package:eden_farm_test/src/views/list_weight/list_weight.dart';
import 'package:eden_farm_test/src/views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';

class PersistenceBottomNavBar extends StatefulWidget {
  const PersistenceBottomNavBar({Key? key}) : super(key: key);

  @override
  _PersistenceBottomNavBarState createState() =>
      _PersistenceBottomNavBarState();
}

class _PersistenceBottomNavBarState extends State<PersistenceBottomNavBar> {
  final autoSizeGroup = AutoSizeGroup();
  final ProfileController _profileController = Get.put(ProfileController());
  int? _selectedBar;
  bool back = false;

  String? _path;

  @override
  void initState() {
    super.initState();

    _selectedBar = 0;
    EasyLoading.dismiss();
  }

  final List<Widget> _buildScreens = <Widget>[
    const HomePage(),
    const ListWeight(),
    const ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedBar = index;
    });
  }

  final iconList = <IconData>[
    Icons.info,
    Icons.list_alt_rounded,
    Icons.person,
  ];
  final nameBarList = <String>['Beranda', 'Semua Daftar', 'Profil'];

  @override
  Widget build(BuildContext context) {
     _profileController.getProfil();
    return WillPopScope(
      onWillPop: () {
        showDialog<bool>(
          context: context,
          builder: (c) => AlertDialog(
            title: const Text('Keluar'),
            content: const Text(
              'Anda ingin keluar aplikasi?',
            ),
            actions: [
              TextButton(
                child: const Text(
                  'Yes',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () => exit(0),
              ),
              TextButton(
                child: const Text('No', style: TextStyle(color: Colors.black)),
                onPressed: () => Navigator.pop(c, false),
              ),
            ],
          ),
        );
        return Future.value(back);
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedBar,
          children: _buildScreens,
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? kMaincolor : Colors.grey;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 24,
                  color: color,
                ),
                const SizedBox(height: 4),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: AutoSizeText(
                      nameBarList[index],
                      maxLines: 1,
                      style: TextStyle(color: color),
                      group: autoSizeGroup,
                    ))
              ],
            );
          },
          backgroundColor: Colors.white,
          elevation: 32,
          gapWidth: 0,
          splashColor: kFillColor,
          splashSpeedInMilliseconds: 300,
          activeIndex: _selectedBar!,
          gapLocation: GapLocation.end,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
