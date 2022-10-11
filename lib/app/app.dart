import 'package:flutter/material.dart';
import 'package:violin/app/presentation/albums/album_details_page.dart';
import 'package:violin/app/presentation/albums/albums_page.dart';
import 'package:violin/app/presentation/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
      routes: {
        AlbumsPage.routeName: (context) => const AlbumsPage(),
        AlbumDetailsPage.routeName: (context) => const AlbumDetailsPage(),
      },
    );
  }
}
