import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width - 80,
          height: double.infinity,
          color: Colors.teal,
          child: SafeArea(
            child: Column(
              children: const [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Icon(
                      CupertinoIcons.person,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    "Babacar THIOYE",
                    style: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  subtitle: Text(
                    "Developper",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.zero,
                  child: Divider(
                    color: Colors.amber,
                    height: 5,
                  ),
                ),
                ListTile(
                  leading: SizedBox(
                      height: 20,
                      width: 34,
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                      )),
                  title: Text(
                    "Parametres",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  leading: SizedBox(
                      height: 20,
                      width: 34,
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                      )),
                  title: Text(
                    "Parametres",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
