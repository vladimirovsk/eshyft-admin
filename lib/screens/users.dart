import 'package:eshyftadmin/screens/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
       drawer: NavBarScreen(),
       appBar: AppBar(
         title: Text('Users', style: TextStyle( ), textAlign: TextAlign.center,),
       ),
       body: Padding(
         padding: EdgeInsets.all(30),
       )
   );
  }

}
