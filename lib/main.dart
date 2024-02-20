//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:luminmusic/models/playlist_provider.dart';
import 'package:luminmusic/themes/dark_theme.dart';
import 'package:luminmusic/themes/light_theme.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'package:luminmusic/themes/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PlaylistProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
