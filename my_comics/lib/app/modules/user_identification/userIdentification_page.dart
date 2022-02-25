import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_comics/app/components/button_component.dart';
import 'package:my_comics/app/components/input_component.dart';
import 'package:my_comics/app/core/themes/app_colors.dart';
import 'package:my_comics/app/core/themes/app_text_styles.dart';
import 'package:my_comics/app/modules/user_identification/userIdentification_store.dart';
import 'package:flutter/material.dart';

class UserIdentificationPage extends StatefulWidget {
  final String title;
  const UserIdentificationPage(
      {Key? key, this.title = 'UserIdentificationPage'})
      : super(key: key);
  @override
  UserIdentificationPageState createState() => UserIdentificationPageState();
}

class UserIdentificationPageState extends State<UserIdentificationPage> {
  final UserIdentificationStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: screen.height,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: screen.width * .80,
                  child: Text(
                    'Welcome, please identify yourself 😊',
                    style: AppStyles.title,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: screen.width * .65,
                  child: InputComponent(
                    title: 'Your Name',
                    onSubimit: (value) {
                      store.userName = value;
                      store.validateAndSavedUserName(context);
                    },
                    onChange: (value) {
                      store.userName = value;
                    },
                    textAction: TextInputAction.done,
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 56,
                  child: Observer(
                    builder: (_) {
                      return ButtonComponent(
                        title: store.isLoading
                            ? const CircularProgressIndicator(
                                color: AppColors.greyComics,
                                strokeWidth: 1,
                              )
                            : const Icon(
                                Icons.arrow_forward_ios_rounded,
                              ),
                        onPressed: () =>
                            store.validateAndSavedUserName(context),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
