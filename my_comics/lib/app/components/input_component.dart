import 'package:flutter/material.dart';
import 'package:my_comics/app/core/themes/app_colors.dart';
import 'package:my_comics/app/core/themes/app_text_styles.dart';

class InputComponent extends StatelessWidget {
  const InputComponent({
    Key? key,
    this.title,
    this.textAction,
    this.onChange,
    this.onSubimit,
  }) : super(key: key);

  final String? title;
  final TextInputAction? textAction;
  final Function(String value)? onChange;
  final Function(String value)? onSubimit;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppStyles.label,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.orangeComics,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.orangeComics,
          ),
        ),
        hintText: title,
        hintStyle: AppStyles.label,
      ),
      cursorColor: AppColors.orangeComics,
      textInputAction: textAction ?? TextInputAction.none,
      onSubmitted: onSubimit,
      onChanged: onChange,
    );
  }
}
