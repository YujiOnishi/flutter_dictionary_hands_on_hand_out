import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  build(BuildContext context) {
    //①Drawerを生成
    return Drawer(
      //②メニューが複数個になったことを考えてListViewで作成
      child: ListView(
        //childrenはWidget型の配列
        children: <Widget>[
        
//////////////////////////////////////////////
          //③Userアカウント
          //マジックストリングスはよしなに変更可能
          UserAccountsDrawerHeader(
            accountName: Text('お問い合わせは以下まで'),
            accountEmail: Text('freelancer@y-onishi.net'),
          ),
//////////////////////////////////////////////

        ],
      ),
    );
  }
}
