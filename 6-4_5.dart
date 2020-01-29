import 'package:flutter/material.dart';
//�@firestore�C���|�[�g
import 'package:cloud_firestore/cloud_firestore.dart';

class FormData {
  String type = "en";
  String word = "";
}

class InputForm extends StatefulWidget {
  InputForm();

  @override
  MyInputFormState createState() => MyInputFormState();
}

class MyInputFormState extends State<InputForm> {
  //�Afirestore�p�Ƀ��t�@�����X�p��
  DocumentReference mainReference =
      Firestore.instance.collection('dictionary').document();
  //�Bform�p��key��p��
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FormData data = FormData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('���[�h�o�^'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
            
//////////////////////////////////////////////
              //�C�ۑ�������
              //validate��save(�e�L�X�g�t�B�[���h��save����������)��firestore�ۑ�����
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                mainReference.setData(
                  {
                    'type': data.type,
                    'word': data.word,
                    'created_at': DateTime.now(),
                  },
                );
                Navigator.pop(context);
//////////////////////////////////////////////

              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
        
//////////////////////////////////////////////
          //�Dform��key�ݒ�
          key: formKey,
//////////////////////////////////////////////

          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              RadioListTile(
                value: "en",
                groupValue: data.type,
                title: Text("�p�a"),
                onChanged: (String value) {
                  setState(
                    () {
                      data.type = value;
                    },
                  );
                },
              ),
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
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.library_books),
                  hintText: '���[�h',
                  labelText: 'word',
                ),
                onSaved: (String value) {
                  data.word = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return '���[�h�͕K�{���͍��ڂł�';
                  }
                  return null;
                },
                initialValue: data.word,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
