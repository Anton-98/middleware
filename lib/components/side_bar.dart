import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SafeArea(
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
                    height: 10,
                  ),
                ),
                ListTile(
                  leading: SizedBox(
                      height: 34,
                      width: 34,
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                      )),
                  title: Text(
                    "Parametres",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
