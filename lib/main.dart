import 'package:flutter/material.dart';

import './firstPage.dart' as FirstPage;
import './secondPage.dart' as SecondPage;
import './thirdPage.dart' as ThirdPage;

void main() {
  runApp(new MaterialApp(
    home: new MyTabs(),
  ));
}


class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pages"),
        backgroundColor: Colors.blue,
        bottom: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.accessibility_new)),
            new Tab(icon: new Icon(Icons.favorite)),
            new Tab(icon: new Icon(Icons.local_pizza)),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new FirstPage.First(),
          new SecondPage.Second(),
          new ThirdPage.Third(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.pinkAccent,
        child: new TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.accessibility_new)),
            new Tab(icon: new Icon(Icons.favorite)),
            new Tab(icon: new Icon(Icons.local_pizza)),
          ],
        ),
      )
    );
  }
}