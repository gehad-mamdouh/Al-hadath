
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_colors.dart';
import '../../../provider/my_provider.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1 ;
  static const int settings = 2 ;
  Function onSideMenuItemClick ;
  HomeDrawer({super.key, required this.onSideMenuItemClick});
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical:MediaQuery.of(context).size.height*0.1,
          ),
          width: double.infinity,
          color: AppColors.primarylightColor,
          child: Text('Menu !'.tr(),
            style:TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor
            ),
            textAlign: TextAlign.center,),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: (){
              onSideMenuItemClick(categories);
            },
            child: Row(
              children: [
                 Icon(Icons.list,color:AppColors.primarylightColor ,),
                 SizedBox(width: 10,),
                Text('Categories'.tr(),
                  style:  TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primarylightColor)
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: (){
              onSideMenuItemClick(HomeDrawer.settings);
            },
            child: Row(
              children: [
                Icon(Icons.settings,color:AppColors.primarylightColor,),
                SizedBox(width: 10,),
                Text('Settings'.tr(),
                  style:  TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primarylightColor
    ),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
