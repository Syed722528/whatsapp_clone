import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/utils/mock_data.dart';

import '../../../constants/app_colors.dart';
import '../../../provider/menu_provider.dart';

AppBar buildChatsAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      'WhatsApp',
      style: TextStyle(
        color: AppColors
            .whatsappLightGreen, //Overridind the default title color of AppBar
      ),
    ),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
      Consumer<MenuProviderChatsPage>(
        builder: (context, value, child) {
          return IconButton(
              onPressed: () => value.update(), icon: Icon(Icons.more_vert));
        },
      ),
    ],
  );
}

Widget buildChatsBody(BuildContext context) {
  return SafeArea(
    child: Stack(
      children: [
        ListView.builder(
          itemCount: mockData.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return buildSearchBar(context);
            }
            return ListTile(
              leading: CircleAvatar(
                radius: 27,
                backgroundImage:
                    AssetImage('assets/images/default_profile.jpg'),
              ),
              title:
                  Text('${mockData[index]}', style: Theme.of(context).textTheme.bodyMedium),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 8,
                children: [
                  Text('8:26 PM'),
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.green,
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 8),
                    ),
                  )
                ],
              ),
              subtitle: Text('${mockMessage[index]}',style: Theme.of(context).textTheme.bodySmall,),
            );
          },
        ),
        Positioned(
          top: 6,
          right: 11,
          child: Consumer<MenuProviderChatsPage>(
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
                          'New Group',
                          'New Broadcast',
                          'Linked devices',
                          'Starred messages',
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

Widget buildSearchBar(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
    height: 50,
    child: TextField(
      style: TextStyle(
          fontSize: 17, color: Colors.black, fontWeight: FontWeight.normal),
      decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          fillColor: Theme.of(context).brightness == Brightness.dark?
          const Color.fromARGB(255, 66, 65, 65):
          Color(0xFFF0F2F5),
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 0),
          alignLabelWithHint: true),
    ),
  );
}

FloatingActionButton buildChatsFloatingActionButton() {
  return FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.chat_rounded),
  );
}
