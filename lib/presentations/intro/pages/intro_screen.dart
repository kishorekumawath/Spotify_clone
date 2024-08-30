import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/buttons/basic_btn.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/presentations/choose_mode/pages/choose_mode_page.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
              child: Image.asset(AppImages.introBG,fit: BoxFit.fill,)),

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
                    const Text("Enjoy listening to music",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),),
                    const SizedBox(height: 10,),
                    const Text("Discover many music category accounding to your personalized search. listen your favorit music artists and podcasts with ad free ",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.grey,fontSize: 18),textAlign: TextAlign.center,),
                    const SizedBox(height: 30,),
                    BasicBtn(text: "Get Started", tap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ChooseModePage()))),
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
