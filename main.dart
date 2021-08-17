import 'package:flutter/material.dart';
import 'package:lintech/docker.dart';
import 'package:lintech/linux.dart';
import 'package:lintech/profile.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  iconSize: 40.0,
                  hoverColor: Colors.white,
                  icon: Icon(
                    Icons.account_circle,
                  )),
            ],
            centerTitle: true,
            title: Text(
              'LinTech',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            bottom: TabBar(
              tabs: [
                Text('Linux'),
                Text('Docker'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LinuxPage(),
              MyApp(),
            ],
          ),
        ),
      ),
    );
  }
}
