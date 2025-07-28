import 'package:docdoc/presintation/widgets/button_widget.dart';
import 'package:docdoc/presintation/widgets/profile_widgets/profile_pic.dart';
import 'package:docdoc/presintation/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/txt.dart';
import '../../widgets/registration_widgets/phone_num_field_widget.dart';
import '../../widgets/registration_widgets/text_form_field_widget.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  bool _isObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          size.width * 0.04,
          size.height * 0.08,
          size.width * 0.04,
          size.height * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TopBar(text: "Personal information",),
            SizedBox(height: size.height * 0.07),
            ProfilePic(),
            SizedBox(height: size.height * 0.075),
            TextFormFieldWidget(
              hintText: "Name",
              controller: nameController,
              keyType: TextInputType.name,
            ),
            SizedBox(height: size.height * 0.02),
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
            SizedBox(height: size.height * 0.04),
            Text(
              Txt.perInfoTxt,
              style: TextStyle(
                color: ColorsManager.grey,
                fontSize: size.width * 0.035,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),

            ButtonWidget(text: "Save", onTap: (){},),

          ],
        ),
      ),
    );
  }
}
