// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:violin/app/core/colors.dart';
import 'package:violin/app/core/consts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'What are you searching for?',
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: filtersList.length,
              separatorBuilder: (context, snapshot) {
                return SizedBox(
                  width: 8,
                );
              },
              itemBuilder: (context, index) {
                return FilterChip(
                  label: filtersList[index],
                  color: selectedFilter == index
                      ? VColors.secondary
                      : Colors.transparent,
                  onTap: () {
                    setState(() {
                      selectedFilter = index;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
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
