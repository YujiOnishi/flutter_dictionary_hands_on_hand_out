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
        
//////////////////////////////////////////////
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
//////////////////////////////////////////////

      ),
    );
  }
}
