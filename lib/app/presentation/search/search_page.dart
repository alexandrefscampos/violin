// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:violin/app/core/colors.dart';
import 'package:violin/app/core/consts.dart';
import 'package:violin/app/data/repositories/search_repository_impl.dart';
import 'package:violin/app/domain/search/models/search_response_model.dart';
import 'package:violin/app/domain/search/search_service.dart';
import 'package:violin/app/mocks/user_mock.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var selectedFilter = 0;
  SearchResultModel? test;
  final searchService = SearchService(SearchRepositoryImpl());
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'What are you searching for?',
              ),
            ),
            SizedBox(height: 8),
            // SizedBox( //TODO IMPLEMENT IT
            //   height: 50,
            //   child: ListView.separated(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: filtersList.length,
            //     separatorBuilder: (context, snapshot) {
            //       return SizedBox(
            //         width: 8,
            //       );
            //     },
            //     itemBuilder: (context, index) {
            //       return FilterChip(
            //         label: filtersList[index],
            //         color: selectedFilter == index
            //             ? VColors.secondary
            //             : Colors.transparent,
            //         onTap: () {
            //           setState(() {
            //             selectedFilter = index;
            //           });
            //         },
            //       );
            //     },
            //   ),
            // ),
            TextButton(
              onPressed: () async {
                test = await searchService.search(controller.text);

                setState(() {});
              },
              child: Text('Search'),
            ),
            if (test != null)
              ...?test?.results?.map(
                (e) => GestureDetector(
                  onTap: () {
                    _showAddAlbum(e);
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.network(e.artworkUrl100 ?? ''),
                        SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.collectionName ?? '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 8),
                              Text(
                                e.artistName ?? '',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  _showAddAlbum(Results result) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Text('You want to add this album?'),
              TextButton(
                onPressed: () async {
                  userMock.totalAlbums = [
                    ...userMock.totalAlbums,
                    result
                  ]; //TODO DONT LET ADD MULTIPLE TIMES THE SAME ALBUM
                  Navigator.of(context).pop();
                },
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'No',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              // CachedNetworkImage(
              //   imageUrl: result.artworkUrl100 ?? '',
              // )
            ],
          ),
        );
      },
    );
  }
}

final filtersList = ['Best results', 'Albums', 'Artists'];

class FilterChip extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;
  const FilterChip({
    Key? key,
    required this.label,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, //TODO ANIMATE IT
      child: Chip(
        label: Text(label),
        backgroundColor: color,
      ),
    );
  }
}
