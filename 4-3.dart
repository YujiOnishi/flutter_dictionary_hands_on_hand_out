import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  build(BuildContext context) {
    //�@Drawer�𐶐�
    return Drawer(
      //�A���j���[�������ɂȂ������Ƃ��l����ListView�ō쐬
      child: ListView(
        //children��Widget�^�̔z��
        children: <Widget>[
        
//////////////////////////////////////////////
          //�BUser�A�J�E���g
          //�}�W�b�N�X�g�����O�X�͂悵�ȂɕύX�\
          UserAccountsDrawerHeader(
            accountName: Text('���₢���킹�͈ȉ��܂�'),
            accountEmail: Text('freelancer@y-onishi.net'),
          ),
//////////////////////////////////////////////

        ],
      ),
    );
  }
}
