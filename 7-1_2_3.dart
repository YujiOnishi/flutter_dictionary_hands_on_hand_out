import 'package:flutter/material.dart';
import '../widget/drawer_menu.dart';
//‡@import‚ğ’Ç‰Á
import 'package:cloud_firestore/cloud_firestore.dart';
import './input.dart';

class Dictionary extends StatefulWidget {
  @override
  _Dictionary createState() => _Dictionary();
}

class _Dictionary extends State<Dictionary>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final List<Tab> tabs = <Tab>[
    Tab(text: '‰p˜a'),
    Tab(text: '˜a‰p'),
  ];

  @override
  void initState() {
    tabController = TabController(vsync: this, length: tabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ƒ[ƒhˆê——"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () {
              //‡A’Ç‰Áƒ{ƒ^ƒ“‚ğ‰Ÿ‚µ‚½Û‚ÉinputFORM‚ª•\¦‚³‚ê‚é
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => InputForm(),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: tabs,
        ),
      ),
      drawer: DrawerMenu(),
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: tabs.map(
            (Tab tab) {
              //‡Btab‚É‚æ‚Á‚Ä•\¦‚³‚¹‚é“à—e‚ğ•ÏX‚·‚é
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[buildStreamBuilder(tab.text)],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
