import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/constants/app_colors.dart';
import 'package:whatsapp_clone/utils/mock_data.dart';

import '../../../provider/menu_provider.dart';

AppBar buildUpdatesPageAppBar(BuildContext context) {
  return AppBar(
    title: Text('Updates'),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search),
      ),
      Consumer<MenuProviderUpdatesPage>(
        builder: (context, value, child) {
          return IconButton(
              onPressed: () => value.update(), icon: Icon(Icons.more_vert));
        },
      ),
    ],
  );
}

Widget buildUpdatesPageBody(BuildContext context) {
  return SafeArea(
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildStatusBar(context),
                  buildChannelsBar(context),
                  buildExploreChannelsBar(context),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: AppColors.green,
                        fixedSize: Size.fromHeight(35)),
                    child: Text(
                      'Explore Channels',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  )
                ]),
          ),
        ),
        Positioned(
          top: 6,
          right: 11,
          child: Consumer<MenuProviderUpdatesPage>(
            builder: (context, value, child) {
              return value.isOpen
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                          'Create Channel',
                          'Status Privacy',
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
    ),
  );
}

Widget buildStatusBar(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 10,
    children: [
      Text('Status',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      SizedBox(
        height: 170,
        child: ListView.builder(
          itemCount: mockData.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == 0) {
              return CustomStatusCard(
                isUserCard: true,
                profilePicSource: 'assets/images/default_profile.jpg',
              );
            }
            return CustomStatusCard(
              profilePicSource: 'assets/images/default_profile.jpg',
              isUserCard: false,
              contactName: '${mockData[index]}',
            );
          },
        ),
      ),
    ],
  );
}

class CustomStatusCard extends StatelessWidget {
  final String profilePicSource;
  final String? contactName;
  final bool isUserCard;
  const CustomStatusCard({
    super.key,
    required this.profilePicSource,
    this.contactName,
    required this.isUserCard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 8),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(255, 66, 65, 65)
            : Color(0xFFF0F2F5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 1,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage('assets/images/default_profile.jpg'),
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 38,
                  child: CircleAvatar(
                    minRadius: 10,
                    maxRadius: 10,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.add,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            isUserCard ? 'Add status' : contactName!,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
          )
        ],
      ),
    );
  }
}

Widget buildChannelsBar(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Channels',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'Explore',
                  style: TextStyle(color: AppColors.green),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                  color: AppColors.green,
                ),
              ],
            ),
          ),
        ],
      ),
      ListTile(
        contentPadding: EdgeInsets.all(1),
        leading: CircleAvatar(
          radius: 28,
        ),
        title: Text(
          '${mockData[3]}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle:
            Text('Someting', style: Theme.of(context).textTheme.bodySmall),
        trailing: Text('Yesterday'),
      )
    ],
  );
}

Widget buildExploreChannelsBar(BuildContext context) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(mockChannelsName.length, (index) {
        if (index == 0) {
          return Text(
            'Find cannnels to follow',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          );
        } else {
          return ListTile(
            contentPadding: EdgeInsets.all(1),
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/images/default_profile.jpg'),
            ),
            title: Text(
              '${mockChannelsName[index]}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text('Someting followers',
                style: Theme.of(context).textTheme.bodySmall),
            trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 11, 80, 36),
                    fixedSize: Size.fromHeight(35)),
                onPressed: () {},
                child: Text(
                  'Follow',
                  style: TextStyle(color: Colors.white),
                )),
          );
        }
      }));
}
