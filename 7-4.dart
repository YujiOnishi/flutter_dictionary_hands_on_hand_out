import 'package:flutter/material.dart';
import '../widget/drawer_menu.dart';
import './input.dart';
//�@importを追加
import 'package:cloud_firestore/cloud_firestore.dart';

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
              //�Atabによって表示させる内容を変更する
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                  
////////////////////////////
                    //�Cコメントを外す
                    buildStreamBuilder(tab.text)
////////////////////////////

                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  //�Btabの値によってfirestoreから取ってくる値を変更
  //Firebassの動作はflutterの本筋から外れるためハンズオンでは説明を省きます
  //詳細はコメントを参照してください
  Widget buildStreamBuilder(String tab) {
    //tabのテキストによってqueryタイプを変更
    String queryType = "";
    if (tab == '英和') {
      queryType = 'en';
    } else {
      queryType = 'ja';
    }

    //非同期処理
    //値変更次第viewの状態が変更される
    return StreamBuilder<QuerySnapshot>(
      //firestoreのコレクションから値を取得
      stream: Firestore.instance
          .collection("dictionary")
          .where('type', isEqualTo: queryType)
          .orderBy('created_at', descending: true)
          .snapshots(),
      //値取得時の動作
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //エラー時の処理
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        //コネクションの状態によって表示変更
        switch (snapshot.connectionState) {
          //waiting時
          case ConnectionState.waiting:
            return Text("Loading...");
          //正常接続時
          default:
          
///////////////////////////////////////////
            //�C表示デザインを整える
            return Align(
              alignment: Alignment.topCenter,
              //複数Widgetが入るためColumn利用
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
              ),
            );
///////////////////////////////////////////

        }
      },
    );
  }
}
