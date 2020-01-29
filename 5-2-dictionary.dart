import 'package:flutter/material.dart';
import '../widget/drawer_menu.dart';

//////////////////////////////////////////////
//á@importÇí«â¡
import './input.dart';
//////////////////////////////////////////////

class Dictionary extends StatefulWidget {
  @override
  _Dictionary createState() => _Dictionary();
}

class _Dictionary extends State<Dictionary>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final List<Tab> tabs = <Tab>[
    Tab(text: 'âpòa'),
    Tab(text: 'òaâp'),
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
        title: Text("ÉèÅ[ÉhàÍóó"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () {
            
//////////////////////////////////////////////
              //áAí«â¡É{É^ÉìÇâüÇµÇΩç€Ç…inputFORMÇ™ï\é¶Ç≥ÇÍÇÈ
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => InputForm(),
                ),
              );
//////////////////////////////////////////////

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
              return Text(tab.text);
            },
          ).toList(),
        ),
      ),
    );
  }
}
