import 'package:flutter/material.dart';

//////////////////////////////////////////////
drawermenu�p(�G���[�o���đ��ݎ��m�̂��߂ɃR�����g�O���Ă܂��������͈�U�R�����g�����Ă�������)
//import '../widget/drawer_menu.dart';
//////////////////////////////////////////////

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //�CAppBar��ݒ�
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
        //�DTabBar��z�u����B
        bottom: TabBar(
          //management��length�̏�񂪓�����tabController
          controller: tabController,
          //�z��ƃ����N���Ă���
          tabs: tabs,
        ),
      ),
      
//////////////////////////////////////////////
      //���j���[�o�[�\���̂��߂Ɉ�U�ݒ�
      //drawer: DrawerMenu(),
      //�ETabBar���I�΂ꂽ�ۂ̋���
      body: TabBarView(
        controller: tabController,
        children: tabs.map(
          (Tab tab) {
            //�Gtabs�̃e�L�X�g�������Ă���͂��Ȃ̂Ŋm�F
             return Text(tab.text);
          },
        ).toList(),
      ),
//////////////////////////////////////////////

    );
  }
}