import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/pages/home_page.dart';
import 'package:whatsapp_clone/provider/menu_provider.dart';
import 'package:whatsapp_clone/provider/navigation_provider.dart';

import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MenuProviderChatsPage(),
        ),
          ChangeNotifierProvider(
          create: (_) => MenuProviderCommunitiesPage(),
        ),
          ChangeNotifierProvider(
          create: (_) => MenuProviderCallsPage(),
        ),
  ChangeNotifierProvider(
          create: (_) => MenuProviderUpdatesPage(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
