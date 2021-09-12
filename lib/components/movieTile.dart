import 'dart:io';

import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  final String name;
  final String director;
  MovieTile(
      {required this.image,
      required this.name,
      required this.director,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 600,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10, top: 10),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16))),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16))),
              child: Image.file(
                File(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            director,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          ElevatedButton(onPressed: onPressed, child: Text('Delete'))
        ],
      ),
    );
  }
}
