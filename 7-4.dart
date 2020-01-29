import 'package:flutter/material.dart';
import '../widget/drawer_menu.dart';
import './input.dart';
//�@import��ǉ�
import 'package:cloud_firestore/cloud_firestore.dart';

class Dictionary extends StatefulWidget {
  @override
  _Dictionary createState() => _Dictionary();
}

class _Dictionary extends State<Dictionary>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final List<Tab> tabs = <Tab>[
    Tab(text: '�p�a'),
    Tab(text: '�a�p'),
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
        title: Text("���[�h�ꗗ"),
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
              //�Atab�ɂ���ĕ\����������e��ύX����
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                  
////////////////////////////
                    //�C�R�����g���O��
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

  //�Btab�̒l�ɂ����firestore�������Ă���l��ύX
  //Firebass�̓����flutter�̖{�؂���O��邽�߃n���Y�I���ł͐������Ȃ��܂�
  //�ڍׂ̓R�����g���Q�Ƃ��Ă�������
  Widget buildStreamBuilder(String tab) {
    //tab�̃e�L�X�g�ɂ����query�^�C�v��ύX
    String queryType = "";
    if (tab == '�p�a') {
      queryType = 'en';
    } else {
      queryType = 'ja';
    }

    //�񓯊�����
    //�l�ύX����view�̏�Ԃ��ύX�����
    return StreamBuilder<QuerySnapshot>(
      //firestore�̃R���N�V��������l���擾
      stream: Firestore.instance
          .collection("dictionary")
          .where('type', isEqualTo: queryType)
          .orderBy('created_at', descending: true)
          .snapshots(),
      //�l�擾���̓���
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //�G���[���̏���
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        //�R�l�N�V�����̏�Ԃɂ���ĕ\���ύX
        switch (snapshot.connectionState) {
          //waiting��
          case ConnectionState.waiting:
            return Text("Loading...");
          //����ڑ���
          default:
          
///////////////////////////////////////////
            //�C�\���f�U�C���𐮂���
            return Align(
              alignment: Alignment.topCenter,
              //����Widget�����邽��Column���p
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
