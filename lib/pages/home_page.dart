import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/pages/widgets/calls_page_widgets/calls.dart';
import 'package:whatsapp_clone/pages/widgets/communities_page_widgets/communities.dart';
import 'package:whatsapp_clone/pages/widgets/updates_page_widgets/updates.dart';
import 'package:whatsapp_clone/provider/navigation_provider.dart';
import 'package:whatsapp_clone/utils/screen_util.dart';

import 'widgets/chats_page_widgets/chat.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  //AutomaticKeepAliveClientMixin - For preserving widget state during scrolling/orientation changes

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // For keep alive mixin addition
    ScreenUtil.intit(
        context); //Initializing screen util class for media queries
    print('Widget rebuild'); // Remove this. Just to verify state management

    return Consumer<NavigationProvider>(
      builder: (context, value, child) {
        final List<PreferredSizeWidget?> appBars = [
          buildChatsAppBar(context),
          buildUpdatesPageAppBar(context),
          buildCommunitiesAppBar(context),
          buildCallAppBar(context),
        ];

        final List<Widget> body = [
          buildChatsBody(context),
          buildUpdatesPageBody(context),
          buildCommunitiesBody(context),
          buildCallsBody(context),
        ];
        final List<Widget?> fabs = [
          buildChatsFloatingActionButton(),
          null,
          null,
          buildCallsFloatingActionButton()
        ];

        return Scaffold(
          appBar: appBars[value.selectedIndex],
          body: body[value.selectedIndex],
          floatingActionButton: fabs[value.selectedIndex],
          bottomNavigationBar: _buildBottomNavigationBar(),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return Consumer<NavigationProvider>(
      builder: (context, value, child) {
        return BottomNavigationBar(
          currentIndex: value.selectedIndex,
          onTap: (index) {
            value.update(index);
          },
          type: BottomNavigationBarType.fixed,
          elevation: 2,
          items: [
            BottomNavigationBarItem(
                icon: _buildNavItem(Icons.chat, 0), label: 'Chat'),
            BottomNavigationBarItem(
                icon: _buildNavItem(Icons.update, 1), label: 'Updates'),
            BottomNavigationBarItem(
                icon: _buildNavItem(Icons.people_sharp, 2),
                label: 'Communities'),
            BottomNavigationBarItem(
                icon: _buildNavItem(Icons.call, 3), label: 'Calls'),
          ],
        );
      },
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = context.read<NavigationProvider>().selectedIndex == index;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Color.fromARGB(55, 0, 255, 0) : Colors.transparent,
        borderRadius: BorderRadius.circular(10), // Rounded edges
      ),
      padding:
          EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Adjust padding
      child: Icon(
        icon,
      ),
    );
  }
}
