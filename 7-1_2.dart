import 'package:flutter/material.dart';
import '../widget/drawer_menu.dart';
import './input.dart';

////////////////////////////////////////////
//�@importを追加
import 'package:cloud_firestore/cloud_firestore.dart';
////////////////////////////////////////////

import './input.dart';

class Dictionary extends StatefulWidget {
  @override
  _Dictionary createState() => _Dictionary();
}

class _Dictionary extends State<Dictionary>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final List<Tab> tabs = <Tab>[
    Tab(text: '英和'),
    Tab(text: '和英'),
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
        title: Text("ワード一覧"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () {
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
            
////////////////////////////////////////////
              //�Atabによって表示させる内容を変更する
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                  //buildStreamBuilder(tab.text)
                  ],
                ),
              );
////////////////////////////////////////////

            },
          ).toList(),
        ),
      ),
    );
  }
}
