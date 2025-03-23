import 'dart:async';

import 'package:create_base/app/routers/router_name.dart';
import 'package:create_base/core/di/locator.dart';
import 'package:create_base/core/local/hive_storage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _size = 20.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final screenWidth = MediaQuery.of(context).size.width;

      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _size = screenWidth * 3;
        });
      });
    });
    //Navigator
    Timer(const Duration(seconds: 3), () {
      final storageKey = getIt<GlobalStorage>();
      print("AccessToken: ${storageKey.accessToken}----------");

      if (storageKey.accessToken != null) {
        context.go(RouterName.splashScreen);
      }
      // } else {
      //   context.go(RouterName.login);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            width: _size,
            height: _size,
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1300),
                curve: Curves.easeInOut,
                width: _size,
                height: _size,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 185, 221, 250),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // HyperAnimationLoad(),
              Gap(10),
              Text(
                "H Y P E R  T E C H",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
