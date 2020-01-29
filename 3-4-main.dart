import 'package:flutter/material.dart';

//////////////////////////////////////////////
//�@dictionary.dart�̃C���|�[�g
import './UI/dictionary.dart';
//////////////////////////////////////////////

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.cyan[800],
        primarySwatch: Colors.cyan
      ),
      
//////////////////////////////////////////////
      //�@�\�����e��dictionary��ݒ�
      home: Dictionary(),
//////////////////////////////////////////////

    );
  }
}