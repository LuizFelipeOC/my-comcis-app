import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_comics/app/core/app_images.dart';
import 'package:my_comics/app/core/themes/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Lottie.asset(
          AppImages.loading,
        ),
      ),
    );
  }
}
