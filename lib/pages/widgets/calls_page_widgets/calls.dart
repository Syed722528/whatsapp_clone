import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/constants/app_colors.dart';
import 'package:whatsapp_clone/utils/mock_data.dart';

import '../../../provider/menu_provider.dart';

AppBar buildCallAppBar(BuildContext context) {
  return AppBar(
    title: Text('Calls'),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search),
      ),
      Consumer<MenuProviderCallsPage>(
        builder: (context, value, child) {
          return IconButton(
              onPressed: () => value.update(), icon: Icon(Icons.more_vert));
        },
      ),
    ],
  );
}

Widget buildCallsBody(BuildContext context) {
  return Stack(
    children: [
      SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                spacing: 18,
                children: [
                  buildAddFavoritesForCallSection(),
                  buildCallSection(context)
                ],
              )),
        ),
      ),
      Positioned(
        top: 6,
        right: 11,
        child: Consumer<MenuProviderCallsPage>(
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
                        'Create call logs',
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

Widget buildCallSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: List.generate(mockData.length, (index) {
      if (index == 0) {
        return Text('Recents');
      }
      return ListTile(
        contentPadding: EdgeInsets.all(1),
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/default_profile.jpg'),
          radius: 22,
        ),
        title: Text(
          '${mockData[index]}',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.call_made_rounded,
              color: Colors.red,
            ),
            Text(
              'Yesterday, 6:31 PM',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.call_outlined)),
      );
    }),
  );
}

Widget buildAddFavoritesForCallSection() {
  return Column(
    spacing: 14,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Favorites'),
      GestureDetector(
        onTap: () {},
        child: Row(
          spacing: 10,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.green,
              child: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
            Text('Add Favorite'),
          ],
        ),
      )
    ],
  );
}

Widget buildCallsFloatingActionButton() {
  return FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add_ic_call_rounded),
  );
}
