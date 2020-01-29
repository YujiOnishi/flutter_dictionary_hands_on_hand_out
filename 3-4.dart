import 'package:flutter/material.dart';
import '../widget/drawer_menu.dart';

class Dictionary extends StatefulWidget {
  @override
  _Dictionary createState() => _Dictionary();
}

class _Dictionary extends State<Dictionary> with SingleTickerProviderStateMixin {
  //�@TabController�̍쐬
  TabController tabController;
  //�ATabList���쐬
  final List<Tab> tabs = <Tab>[
    Tab(text: '�p�a'),
    Tab(text: '�a�p'),
  ];

  @override
  void initState() {
    //�BTabController��tab��length��ݒ肷��B
    //vsync�Ń^�u�̏�Ԃ����C���X�^���X�ɐݒ肷��B
    tabController = TabController(vsync: this, length: tabs.length);
    super.initState();
  }

//////////////////////////////////////////////
  //�CAppBar��ݒ�
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("���[�h�ꗗ"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () {
              //�ǉ����̐ݒ�̂��ߒ��g�͂܂��Ȃ��B
            },
          ),
        ],
      ),
    );
  }
//////////////////////////////////////////////

}