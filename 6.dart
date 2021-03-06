import 'package:flutter/material.dart';
//�@firestoreインポート
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
  //�Afirestore用にリファレンス用意
  DocumentReference mainReference =
      Firestore.instance.collection('dictionary').document();
  //�Bform用のkeyを用意
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FormData data = FormData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ワード登録'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              //�C保存時処理
              //validate＆save(テキストフィールドのsave処理が走る)＆firestore保存処理
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
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          //�Dformにkey設定
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              RadioListTile(
                value: "en",
                groupValue: data.type,
                title: Text("英和"),
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
                title: Text("和英"),
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
                  hintText: 'ワード',
                  labelText: 'word',
                ),
                onSaved: (String value) {
                  data.word = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'ワードは必須入力項目です';
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
