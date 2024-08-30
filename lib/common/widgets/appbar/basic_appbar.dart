import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helper/dark_mode.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
class BasicAppbar extends StatelessWidget implements PreferredSizeWidget{
  const BasicAppbar({super.key, this.title,this.actions,this.offBackBtn = false, this.backgroundColor});
  final Widget? title;
  final List<Widget>? actions;
  final bool offBackBtn;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext cxt) {
    return AppBar(
      backgroundColor: backgroundColor ?? (cxt.isDarkMode?AppColors.darkBackground:AppColors.lightBackground),
      automaticallyImplyLeading: false,
      actions: actions,
      title: title,
      leading: offBackBtn?null:IconButton(
        iconSize: 25,
        onPressed: ()=>Navigator.pop(cxt),
        icon: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: cxt.isDarkMode?Colors.white.withOpacity(0.2):AppColors.grey,
            ),
            child: Icon(Icons.arrow_back_ios,color: cxt.isDarkMode?Colors.white:Colors.black,)),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

