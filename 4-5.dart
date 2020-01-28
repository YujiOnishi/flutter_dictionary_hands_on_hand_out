import 'package:flutter/material.dart';
//�Ddictionary���C���|�[�g����
import '../UI/dictionary.dart';

class DrawerMenu extends StatelessWidget {
  @override
  build(BuildContext context) {
    //�@Drawer�𐶐�
    return Drawer(
      //�A���j���[�������ɂȂ������Ƃ��l����ListView�ō쐬
      child: ListView(
        //children��Widget�^�̔z��
        children: <Widget>[
          //�BUser�A�J�E���g
          //�}�W�b�N�X�g�����O�X�͂悵�ȂɕύX�\
          UserAccountsDrawerHeader(
            accountName: Text('���₢���킹�͈ȉ��܂�'),
            accountEmail: Text('freelancer@y-onishi.net'),
          ),
          //�C���j���[�p�̃��X�g�^�C��
          //�}�W�b�N�X�g�����O�X�͂悵�ȂɕύX�\
          ListTile(
            title: Text('���[�h�ꗗ'),
            //�DTap�C�x���g���̋���
            onTap: () {
              //��ʑJ�ڂ̐ݒ�
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Dictionary(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
