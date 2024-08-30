import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/helper/dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/basic_appbar.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentations/auth/pages/signin_page.dart';
import 'package:spotify_clone/presentations/auth/pages/signup_page.dart';
import 'package:spotify_clone/presentations/intro/pages/intro_screen.dart';
import 'package:spotify_clone/presentations/root/pages/root.dart';

import '../../../common/widgets/buttons/basic_btn.dart';

import '../../../core/configs/theme/app_colors.dart';

class LoginSignupPage extends StatelessWidget {
  const LoginSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const  BasicAppbar(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
              child: SvgPicture.asset(AppVectors.patternBG)),
          SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppVectors.logo),
                    const SizedBox(height: 40,),
                    Text("Enjoy listening to music",style: TextStyle(fontWeight: FontWeight.bold,color:context.isDarkMode? Colors.white:Colors.black,fontSize: 24),),
                    const SizedBox(height: 10,),
                    Text("Discover many music category accounting to your personalized search. listen your favorite music artists and podcasts with ad free ",style: TextStyle(fontWeight: FontWeight.w500,color: context.isDarkMode?AppColors.grey:AppColors.darkGrey,fontSize: 15),textAlign: TextAlign.center,),
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                        Expanded(child: BasicBtn(text: "Register", tap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (cnt)=>SignupPage())))),
                        const SizedBox(width: 60,),
                        TextButton(onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (cnt)=>SigninPage())), child: Text("Sign In",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:context.isDarkMode? Colors.white:Colors.black),)),
                      ],
                    ),
                    const SizedBox(height: 40,),
                    TextButton(onPressed: ()=>Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => const RootPage()),
                            (route) => false
                    ), child: Text("Without Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:context.isDarkMode? Colors.white:Colors.black),)),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
