import 'package:eshyftadmin/screens/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
       drawer: NavBarScreen(),
       appBar: AppBar(
         title: Text('Settings', style: TextStyle( ), textAlign: TextAlign.center,),
       ),
       body: Padding(
         padding: EdgeInsets.all(30),
       )
   );
  }

}
