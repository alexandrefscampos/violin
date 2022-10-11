// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:violin/app/core/colors.dart';
import 'package:violin/app/domain/search/models/search_response_model.dart';
import 'package:violin/app/mocks/album_list_mock.dart';
import 'package:violin/app/mocks/user_mock.dart';
import 'package:violin/app/presentation/profile/widgets/user_statistic.dart';
import 'package:violin/app/presentation/shared/widgets/album_preview.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Image.network(
                'https://www.univates.br/radio/media/noticias_responsivo/31049/-1645810170.8855_1440_900.jpg',
                height: 200,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment(0, 0.8),
                child: CircleAvatar(
                  radius: 50,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                userMock.name ?? 'User',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${userMock.followers} followers',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    '${userMock.following} followings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserStatistic(
                    title: userMock.totalAlbums.length,
                    statisticName: 'Total albums',
                    textColor: VColors.secondary,
                  ),
                  UserStatistic(
                    title: userMock.totalAlbumsThisYear,
                    statisticName: 'Albums this year',
                    textColor: VColors.tertiary,
                  ),
                  UserStatistic(
                    title: userMock.lists,
                    statisticName: 'Lists',
                    textColor: VColors.secondary,
                  ),
                  UserStatistic(
                    title: userMock.reviews,
                    statisticName: 'Reviews',
                    textColor: VColors.tertiary,
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'User favorite albums',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [...albumList.map((e) => AlbumPreview(path: e.path))],
              ),
              SizedBox(height: 32),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Albums',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          userMock.totalAlbums.length.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class UserModel {
  String? name;
  int followers;
  int following;
  int totalAlbumsThisYear;
  int lists;
  int reviews;
  List<Results> favoriteAlbums;
  List<Results> totalAlbums;

  UserModel({
    this.name,
    this.followers = 0,
    this.following = 0,
    this.totalAlbumsThisYear = 0,
    this.lists = 0,
    this.reviews = 0,
    this.totalAlbums = const [],
    this.favoriteAlbums = const [],
  });
}
