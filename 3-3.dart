import 'package:flutter/material.dart';
import '../widget/drawer_menu.dart';

class Dictionary extends StatefulWidget {
  @override
  _Dictionary createState() => _Dictionary();
}

class _Dictionary extends State<Dictionary> with SingleTickerProviderStateMixin {
  //‡@TabController‚Ìì¬
  TabController tabController;
  //‡ATabList‚ğì¬
  final List<Tab> tabs = <Tab>[
    Tab(text: '‰p˜a'),
    Tab(text: '˜a‰p'),
  ];

  @override
  void initState() {
    //‡BTabController‚Étab‚Ìlength‚ğİ’è‚·‚éB
    //vsync‚Åƒ^ƒu‚Ìó‘Ô‚ğ©ƒCƒ“ƒXƒ^ƒ“ƒX‚Éİ’è‚·‚éB
    tabController = TabController(vsync: this, length: tabs.length);
    super.initState();
  }
}