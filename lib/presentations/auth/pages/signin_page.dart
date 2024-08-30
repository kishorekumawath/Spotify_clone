import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/buttons/basic_btn.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/presentations/auth/pages/signup_page.dart';
import 'package:spotify_clone/presentations/root/pages/root.dart';

import '../../../common/widgets/appbar/basic_appbar.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../data/models/auth/signin_user_req.dart';
import '../../../domain/usecases/auth/signin.dart';
import '../../../service_locator.dart';


class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 30
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(height: 50,),
            _emailField(context),
            const SizedBox(height: 20,),
            _passwordField(context),
            const SizedBox(height: 20,),
            BasicBtn(
                tap: () async {
                  var result = await sl<SigninUseCase>().call(
                      params: SigninUserReq(
                          email: _email.text.toString(),
                          password: _password.text.toString()
                      )
                  );
                  result.fold(
                          (l){
                        var snackbar = SnackBar(content: Text(l,style: TextStyle(color: Colors.white),),behavior: SnackBarBehavior.floating,backgroundColor: Colors.black,);
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                          (r){
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => const RootPage()),
                                (route) => false
                        );
                      }
                  );
                },
                text: 'Sign In'
            )

          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
      ),
      textAlign: TextAlign.center,
    );
  }


  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
          hintText: 'Enter Email'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
          hintText: 'Password'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not A Member? ',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14
            ),
          ),
          TextButton(
              onPressed: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignupPage()
                    )
                );
              },
              child: const Text(
                  'Register Now',style: TextStyle(color: AppColors.primary),
              )
          )
        ],
      ),
    );
  }
}