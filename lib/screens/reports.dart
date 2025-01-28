import 'package:eshyftadmin/screens/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});
  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
       drawer: NavBarScreen(),
       appBar: AppBar(
         title: Text('Reports', style: TextStyle( ), textAlign: TextAlign.center,),
       ),
       body: Padding(
         padding: EdgeInsets.all(30),
       )
   );
  }

}
