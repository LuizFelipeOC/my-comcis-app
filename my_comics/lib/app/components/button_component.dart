import 'package:flutter/material.dart';
import 'package:my_comics/app/core/themes/app_colors.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({Key? key, this.title, this.onPressed})
      : super(key: key);

  final Widget? title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: title,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppColors.orangeComics,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // <-- Radius
        ),
      ),
    );
  }
}
