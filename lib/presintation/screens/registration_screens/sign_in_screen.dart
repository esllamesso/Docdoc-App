import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/core/utils/txt.dart';
import 'package:docdoc/presintation/widgets/sign_in_widgets/divider_widget.dart';
import 'package:docdoc/presintation/widgets/sign_in_widgets/sign_in_options_widget.dart';
import 'package:docdoc/presintation/widgets/sign_in_widgets/text_form_field_widget.dart';
import 'package:docdoc/presintation/widgets/sign_in_widgets/text_span_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/sign_in_widgets/check_box_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isObscure = true;
  bool isRememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          size.width * 0.08,
          size.height * 0.12,
          size.width * 0.08,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.w700,
                color: ColorsManager.blue,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              Txt.startedTxt,
              style: TextStyle(
                color: ColorsManager.grey,
                fontSize: size.width * 0.035,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: size.height * 0.045),
            TextFormFieldWidget(
              hintText: "Email",
              controller: emailController,
              keyType: TextInputType.emailAddress,
            ),
            SizedBox(height: size.height * 0.02),
            TextFormFieldWidget(
              hintText: "Password",
              obscureText: _isObscure,
              controller: passController,
              keyType: TextInputType.visiblePassword,
              suffIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                  color: ColorsManager.lightGrey,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
            ),
            SizedBox(height: size.height * 0.03),
            CheckBoxWidget(),
            SizedBox(height: size.height * 0.04),
            SizedBox(
              height: size.height * 0.065,
              width: double.infinity,
              child: InkWell(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorsManager.blue,
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w600,
                        color: ColorsManager.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.06),
            DividerWidget(),
            SizedBox(height: size.height * 0.04),
            SignInOptionsWidget(),
            SizedBox(height: size.height * 0.04),
            TextSpanWidget(),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account yet?",
                  style: TextStyle(
                    fontSize: size.width * 0.028,
                    fontWeight: FontWeight.w400,
                    color: ColorsManager.black,
                  ),
                ),
                SizedBox(width: size.width * 0.01),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: (){},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: size.width * 0.028,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
