// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:violin/app/core/colors.dart';
import 'package:violin/app/mocks/album_list_mock.dart';
import 'package:violin/app/profile/profile_page.dart';
import 'package:violin/app/search/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _actualIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VColors.primary,
      drawer: Drawer(
        backgroundColor: VColors.primary,
        child: Column(children: const []),
      ),
      appBar: AppBar(
        backgroundColor: VColors.primary,
        elevation: 0,
        actions: const [CircleAvatar()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _actualIndex,
        onTap: (value) => setState(() {
          _actualIndex = value;
        }),
        backgroundColor: VColors.primary,
        selectedItemColor: VColors.secondary,
        unselectedItemColor: VColors.white.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
        ],
      ),
      body: screenList[_actualIndex],
    );
  }
}

const screenList = [HomeBody(), SearchPage(), ProfilePage()];

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hello, User!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 1),
          const Text(
            'Review or track albums you\'ve watched...',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Popular this month',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: albumList.length,
              itemBuilder: (BuildContext context, int index) => Card(
                child: Image.network(
                  albumList[index].path,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Popular this month',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: albumList.length,
              itemBuilder: (BuildContext context, int index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Image.network(
                      albumList[index].path,
                      fit: BoxFit.contain,
                      height: 92,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    albumList[index].name!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: VColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      CircleAvatar(),
                      SizedBox(width: 4),
                      Text(
                        'Alejandro',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: VColors.secondary,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
