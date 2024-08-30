import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/presentations/auth/pages/login_signup.dart';
import 'package:spotify_clone/presentations/choose_mode/bloc/theme_cubit.dart';

import '../../../common/widgets/buttons/basic_btn.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/theme/app_colors.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(AppImages.introBG2,fit: BoxFit.fill,)),

          SafeArea(
            child: SizedBox(
              width:MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SvgPicture.asset(AppVectors.logo),
                    const Spacer(),
                    const Text("Choose Mode",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                          Column(
                            children: [
                              ClipOval(
                                child: BackdropFilter(
                                  filter:ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                                  child: GestureDetector(
                                    onTap: ()=>context.read<ThemeCubit>().updateTheme(ThemeMode.dark),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.2),
                                        shape: BoxShape.circle
                                      ),
                                      child: const Icon(Icons.nightlight_round,color: Colors.white,size: 30,),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text("Dark Mode",style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        Column(
                          children: [
                            ClipOval(
                              child: BackdropFilter(
                                filter:ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                                child: GestureDetector(
                                  onTap: ()=> context.read<ThemeCubit>().updateTheme(ThemeMode.light),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.2),
                                        shape: BoxShape.circle
                                    ),
                                    child: const Icon(Icons.sunny,color: Colors.white,size: 30,),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("Light Mode",style: TextStyle(color: Colors.white),)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 30,),
                    BasicBtn(text: "Continue", tap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginSignupPage()))),
                    const SizedBox(height: 40,),
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
