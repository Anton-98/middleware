import 'package:flutter/material.dart';
import 'package:middleware/utils/nav_bar.dart';
import 'package:middleware/utils/reutilisable.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: Reutillisable().getAppBar("Accueil"),
    );
  }
}
