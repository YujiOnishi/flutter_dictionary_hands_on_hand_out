import 'package:flutter/material.dart';
import '../widget/drawer_menu.dart';

class Dictionary extends StatefulWidget {
  @override
  _Dictionary createState() => _Dictionary();
}

class _Dictionary extends State<Dictionary> with SingleTickerProviderStateMixin {
  //①TabControllerの作成
  TabController tabController;
  //②TabListを作成
  final List<Tab> tabs = <Tab>[
    Tab(text: '英和'),
    Tab(text: '和英'),
  ];

  @override
  void initState() {
    //③TabControllerにtabのlengthを設定する。
    //vsyncでタブの状態を自インスタンスに設定する。
    tabController = TabController(vsync: this, length: tabs.length);
    super.initState();
  }

//////////////////////////////////////////////
  //④AppBarを設定
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ワード一覧"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () {
              //追加時の設定のため中身はまだない。
            },
          ),
        ],
      ),
    );
  }
//////////////////////////////////////////////

}