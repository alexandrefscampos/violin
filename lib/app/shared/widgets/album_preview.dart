import 'package:flutter/material.dart';

class AlbumPreview extends StatelessWidget {
  final String path;
  const AlbumPreview({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        path,
        height: 120,
        width: 90,
        fit: BoxFit.cover,
      ),
    );
  }
}
