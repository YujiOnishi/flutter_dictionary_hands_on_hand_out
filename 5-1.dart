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
}
