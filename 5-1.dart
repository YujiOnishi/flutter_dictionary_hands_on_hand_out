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
}
