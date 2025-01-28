import 'package:eshyftadmin/screens/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimecadsScreen extends StatefulWidget {
  const TimecadsScreen({super.key});
  @override
  _TimecadsScreenState createState() => _TimecadsScreenState();
}

class _TimecadsScreenState extends State<TimecadsScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
       drawer: NavBarScreen(),
       appBar: AppBar(
         title: Text('Timecards', style: TextStyle( ), textAlign: TextAlign.center,),
       ),
       body: Padding(
         padding: EdgeInsets.all(30),
       )
   );
  }

}
