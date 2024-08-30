import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/helper/dark_mode.dart';

import '../../../common/widgets/appbar/basic_appbar.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../profile/profile.dart';
import '../widgets/news_song.dart';
import '../widgets/playlist.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _HomePageState();
}

class _HomePageState extends State<RootPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        offBackBtn:true,
        actions: [IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => const ProfilePage())
              );
            },
            icon: const Icon(
                Icons.person
            )
        ),],
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs(),
            SizedBox(
              height: 280,
              child: TabBarView(
                controller: _tabController,
                children: [
                 const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child:  NewsSongs(),
                  ),
                  Container(),
                  Container(),
                ],
              ),
            ),
            const PlayList()
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard(){
    return Center(
      child: SizedBox(
        height: 160,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                  AppVectors.homeTopCard
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 60
                ),
                child: Image.asset(
                    AppImages.homeArtist
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,

      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      indicatorColor: AppColors.primary,
      padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 16
      ),
      tabs: const [
        Text(
          'News',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
          ),
        ),
        Text(
          'Videos',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
          ),
        ),
        Text(
          'Artists',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
          ),
        ),


      ],
    );
  }
}