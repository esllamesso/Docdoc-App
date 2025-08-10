import 'package:docdoc/presintation/screens/registration_screens/face_id_screen.dart';
import 'package:docdoc/presintation/widgets/button_widget.dart';
import 'package:docdoc/presintation/widgets/registration_widgets/have_acc_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/txt.dart';
import '../../widgets/registration_widgets/check_box_widget.dart';
import '../../widgets/registration_widgets/divider_widget.dart';
import '../../widgets/registration_widgets/sign_in_options_widget.dart';
import '../../widgets/registration_widgets/text_form_field_widget.dart';
import '../../widgets/registration_widgets/text_span_widget.dart';
import '../../widgets/registration_widgets/phone_num_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscure = true;
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
          size.height * 0.08,
          size.width * 0.08,
          0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.blue,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                Txt.startedTxt2,
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
              SizedBox(height: size.height * 0.02),
              PhoneNumFieldWidget(),
              SizedBox(height: size.height * 0.03),
              CheckBoxWidget(),
              SizedBox(height: size.height * 0.04),
              ButtonWidget(text: "Create Account", onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> FaceIdScreen()));
              },),
              SizedBox(height: size.height * 0.06),
              DividerWidget(),
              SizedBox(height: size.height * 0.04),
              SignInOptionsWidget(),
              SizedBox(height: size.height * 0.04),
              TextSpanWidget(),
              SizedBox(height: size.height * 0.03),
              HaveAccWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
