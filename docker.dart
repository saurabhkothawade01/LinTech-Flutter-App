import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  web() async {
    var url = Uri.http("192.168.56.106", "/cgi-bin/cmd.py", {"x": cmd});
    var response = await http.get(url);
    print(response.body);
    //print(cmd);
    setState(() {
      result = response.body;
    });
  }

  late String cmd;
  var result = ' ';

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              height: 70.0,
              child: Image(
                image: NetworkImage(
                    'https://raw.githubusercontent.com/saurabhkothawade01/Saurabh-Image/master/Moby-logo.png'),
                height: 70.0,
                width: 70.0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'Enter Docker Command',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: TextField(
                onChanged: (value) {
                  cmd = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Docker Command',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
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
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: TextStyle(fontSize: 20),
                        ),
                        onPressed: web,
                        child: Text('RUN'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /*Container(
              padding: EdgeInsets.only(top: 10.0),
              child: OutlinedButton(
                onPressed: web,
                child: Text(
                  'RUN',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),*/
            Container(
              padding: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child: Text(
                'Output',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    "${result}",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              margin: EdgeInsets.only(top: 20.0),
              color: Colors.grey.shade200,
              width: 350.0,
              height: 250.0,
            ),
          ],
        ),
      ),
    );
  }
}
