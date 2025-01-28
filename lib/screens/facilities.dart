import 'package:eshyftadmin/screens/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FacilitiesScreen extends StatefulWidget {
  const FacilitiesScreen({super.key});
  @override
  _FacilitiesScreenState createState() => _FacilitiesScreenState();
}

class _FacilitiesScreenState extends State<FacilitiesScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
       drawer: NavBarScreen(),
       appBar: AppBar(
         title: Text('Facilities', style: TextStyle( ), textAlign: TextAlign.center,),
       ),
       body: Padding(
         padding: EdgeInsets.all(30),
       )
   );
  }

}
