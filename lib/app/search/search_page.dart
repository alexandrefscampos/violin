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
          ListView.separated(
            itemCount: 3,
            separatorBuilder: (context, snapshot) {
              return FilterChip(
                label: 'Best Results',
                isSelected: true,
              );
            },
            itemBuilder: (context, snapshot) {
              return FilterChip(
                label: 'Best Results',
                isSelected: true,
              );
            },
          ),
        ],
      ),
    );
  }
}

class FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function? onTap;
  const FilterChip({
    Key? key,
    required this.label,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap, //TODO check this
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? VColors.secondary : Colors.transparent,
      ),
    );
  }
}
