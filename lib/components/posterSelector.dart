import 'package:flutter/material.dart';
import 'dart:io';

class PosterSelector extends StatelessWidget {
  final String? path;
  final VoidCallback onPressed;
  PosterSelector({this.path, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(16)),
        child: path == null
            ? Center(
                child: Icon(
                Icons.add_a_photo_rounded,
                size: 200,
              ))
            : Image.file(
                File(path!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
