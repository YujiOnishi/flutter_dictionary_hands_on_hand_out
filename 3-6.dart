import 'package:flutter/material.dart';

//////////////////////////////////////////////
drawermenu用(エラー出して存在周知のためにコメント外してます実装時は一旦コメント化してください)
//import '../widget/drawer_menu.dart';
//////////////////////////////////////////////

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //④AppBarを設定
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
        //⑤TabBarを配置する。
        bottom: TabBar(
          //managementとlengthの情報が入ったtabController
          controller: tabController,
          //配列とリンクしている
          tabs: tabs,
        ),
      ),
      
//////////////////////////////////////////////
      //メニューバー表示のために一旦設定
      //drawer: DrawerMenu(),
      //⑥TabBarが選ばれた際の挙動
      body: TabBarView(
        controller: tabController,
        children: tabs.map(
          (Tab tab) {
            //⑧tabsのテキストが入ってくるはずなので確認
             return Text(tab.text);
          },
        ).toList(),
      ),
//////////////////////////////////////////////

    );
  }
}