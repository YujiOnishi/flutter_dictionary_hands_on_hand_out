import 'package:flutter/material.dart';

//�@Form�p�̍\���̂�p��
class FormData {
  //type�̏����l
  String type = "en";
  String word = "";
}

class InputForm extends StatefulWidget {
  InputForm();

  @override
  MyInputFormState createState() => MyInputFormState();
}

class MyInputFormState extends State<InputForm> {
  FormData data = FormData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('���[�h�o�^'),
        //�A�ۑ��p�̃{�^����ݒ�
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              //�{���ۑ�����������͂��������͂܂���ʂ����@�\����
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        //�BForm��ݒ�
        child: Form(
          //�CForm�͕����E�B�W�F�b�g�̑g�ݍ��킹�Ȃ̂�ListView�𗘗p
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              //�D�p�a�pRadio�{�^��
              RadioListTile(
                value: "en",
                //data�\���̂𗘗p���Ęa�p�Ə�Ԃ����L
                groupValue: data.type,
                //���W�I�{�^�����ɕ\�������e�L�X�g
                title: Text("�p�a"),
                onChanged: (String value) {
                  //�ύX���̃C�x���g����
                  setState(
                    () {
                      //�\���̂�type�̒l��value(en)�ɐݒ�
                      data.type = value;
                    },
                  );
                },
              ),
              //�E�a�p�pRadio�{�^��
              RadioListTile(
                value: "ja",
                groupValue: data.type,
                title: Text("�a�p"),
                onChanged: (String value) {
                  setState(
                    () {
                      data.type = value;
                    },
                  );
                },
              ),
              
//////////////////////////////////////////////
              //�F���[�h���͗p�e�L�X�g�t�B�[���h
              TextFormField(
                //�e�L�X�g�t�B�[���h�̃f�R���[�V����
                decoration: InputDecoration(
                  icon: Icon(Icons.library_books),
                  hintText: '���[�h',
                  labelText: 'word',
                ),
                //�ۑ����̃C�x���g����
                onSaved: (String value) {
                  data.word = value;
                },
                //�o���f�[�V�������̋���
                validator: (value) {
                  if (value.isEmpty) {
                    return '���[�h�͕K�{���͍��ڂł�';
                  }
                  //�o���f�[�V�����N���A�̂Ƃ���return null���Ȃ��ƃ��[�j���O
                  return null;
                },
                initialValue: data.word,
              ),
//////////////////////////////////////////////

            ],
          ),
        ),
      ),
    );
  }
}
