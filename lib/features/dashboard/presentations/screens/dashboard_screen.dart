import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:real_estate_app/features/dashboard/presentations/widgets/nav_bar.dart';
import 'package:real_estate_app/features/home_screen/home_screen.dart';
import 'package:real_estate_app/features/messages/presentations/screens/messages.dart';
import 'package:real_estate_app/features/profile/presentation/screens/profile.dart';
import 'package:real_estate_app/features/search_screen/presentation/screens/searchscreen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int selectindex = 2;
  bool isFABVisible = false;

  static List<StatefulWidget> pages = [
    SearchScreen(key: UniqueKey()),
    const MessageScreen(),
    const HomeScreen(),
    ProfileScreen(),
  ];

  final List icon = [
    Iconsax.search_normal_1,
    Iconsax.message,
    Iconsax.home,
    Icons.favorite,
    Iconsax.user,
  ];

  @override
  void initState() {
    super.initState();
    _showFABWithDelay();
  }

  void _showFABWithDelay() async {
    await Future.delayed(const Duration(seconds: 7));
    setState(() {
      isFABVisible = true;
    });
  }

  void _triggerAnimation(int index) {
    if (index == 0) {
      (pages[index] as SearchScreen).startAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: IndexedStack(index: selectindex, children: pages),
      floatingActionButton: isFABVisible
          ? FadeInUp(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25, right: 40, left: 40),
          child: NavBar(
            hasFab: true,
            navItem: [
              NavItemModel(
                onTap: () {
                  SearchScreen();
                },
                icon: const Icon(Iconsax.search_normal_1, size: 18),
              ),
              NavItemModel(
                onTap: () {},
                icon: const Icon(Iconsax.message, size: 20),
              ),
              NavItemModel(
                onTap: () {},
                icon: const Icon(Iconsax.home_1, size: 20),
              ),
              NavItemModel(
                onTap: () {},
                icon: const Icon(Icons.favorite, size: 20),
              ),
              NavItemModel(
                onTap: () {},
                icon: const Icon(Iconsax.profile_add, size: 20),
              ),
            ],
            onTap: (int index) {
              log('index is $index');
              _switchTap(index);
            },
          ),
        ),
      )
          : null,
    );
  }


  _switchTap(int index) {
    setState(() {
      selectindex = index;
    });
    _triggerAnimation(index);
  }
}

