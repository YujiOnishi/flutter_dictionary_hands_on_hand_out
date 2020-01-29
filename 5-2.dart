import 'package:flutter/material.dart';

//①Form用の構造体を用意
class FormData {
  //typeの初期値
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
        title: Text('ワード登録'),
        
//////////////////////////////////////////////
        //②保存用のボタンを設定
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              //本来保存処理が入るはずだが今はまだ画面を閉じる機能だけ
              Navigator.pop(context);
            },
          ),
        ],
//////////////////////////////////////////////

      ),
    );
  }
}
