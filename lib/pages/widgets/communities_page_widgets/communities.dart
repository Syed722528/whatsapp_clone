import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/constants/app_colors.dart';
import 'package:whatsapp_clone/utils/screen_util.dart';

import '../../../provider/menu_provider.dart';

AppBar buildCommunitiesAppBar(BuildContext context) {
  return AppBar(
    title: Text('Communities'),
    actions: [
      Consumer<MenuProviderCommunitiesPage>(
        builder: (context, value, child) {
          return IconButton(
              onPressed: () => value.update(), icon: Icon(Icons.more_vert));
        },
      ),
    ],
  );
}

Widget buildCommunitiesBody(BuildContext context) {
  return Stack(
    children: [
      Center(
        child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(Theme.of(context).brightness == Brightness.dark
                  ? 'assets/images/communities_image_dark.png'
                  : 'assets/images/communities_image_light.png'),
            ),
            Text(
              'Stay connected with a \ncommunity',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(
              textAlign: TextAlign.center,
              'Communities bring members together in\n topic based groups, and make it easy to get \nadmin announcement. Any community you are\n added to will apear here',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            GestureDetector(
                onTap: () {},
                child: Text(
                  'See Example \ncommunities',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                )),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: ScreenUtil.blockSizeHorizontal * 77,
                decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Start you community',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 6,
        right: 11,
        child: Consumer<MenuProviderCommunitiesPage>(
          builder: (context, value, child) {
            return value.isOpen
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    width: 180,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 0.1)
                        ]),
                    child: Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'Settings',
                      ]
                          .map((text) => Text(
                                text,
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),
                              ))
                          .toList(),
                    ),
                  )
                : Container();
          },
        ),
      )
    ],
  );
}
