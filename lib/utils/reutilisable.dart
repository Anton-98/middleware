import 'package:flutter/material.dart';

class Reutillisable {
  getAppBar(String titre) {
    return AppBar(
      title: Text(
        titre.toUpperCase(),
        style: const TextStyle(
          fontSize: 23,
        ),
      ),
      centerTitle: true,
      elevation: 0.0,

      backgroundColor: Colors.teal,
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: const Icon(Icons.menu),
      // ),
    );
  }
}
