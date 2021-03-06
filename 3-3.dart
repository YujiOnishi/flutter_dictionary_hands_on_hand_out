import 'package:flutter/material.dart';
import '../widget/drawer_menu.dart';

class Dictionary extends StatefulWidget {
  @override
  _Dictionary createState() => _Dictionary();
}

class _Dictionary extends State<Dictionary> with SingleTickerProviderStateMixin {
  //�@TabControllerの作成
  TabController tabController;
  //�ATabListを作成
  final List<Tab> tabs = <Tab>[
    Tab(text: '英和'),
    Tab(text: '和英'),
  ];

//////////////////////////////////////////////
  //�BTabControllerにtabのlengthを設定する。
  @override
  void initState() {
    //vsyncでタブの状態を自インスタンスに設定する。
    tabController = TabController(vsync: this, length: tabs.length);
    super.initState();
  }
//////////////////////////////////////////////

}