import 'dart:convert' as convert;

import 'package:eshyftadmin/services/storage_service.dart';
import 'package:flutter/material.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});
  @override
  _NavBarScreenState createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final StorageService _storageService = StorageService();
  String avatar  = 'https://eshyft.s3.amazonaws.com/avatars/AVATAR_STUB_MANAGER.png';
  String fullName = '';
  String userEmail = '';

  @override
  void initState(){
    getProfile();
  }

  Future getProfile() async {
  final result = await _storageService.readSecureData('profileUser');
  final jsonProfile = convert.jsonDecode(result.toString());

  setState(() {
    avatar = jsonProfile['avatar'];
    fullName = jsonProfile['fullName'];
    userEmail = jsonProfile['email'];
  });

  }

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(fullName),
              accountEmail: Text(userEmail),
              currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                      child: Image.network(avatar,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                      ),
                  ),
          ),
            decoration: BoxDecoration(
              color: Colors.blue,
              // image: DecorationImage(
              //   image: NetworkImage(''),
              //fit: BoxFit.cover
            // ),
          ),
          ),
          ListTile(
            leading: Icon(Icons.description, color: Colors.blue),
            title: Text('Timecards'),
            onTap: () => Navigator.of(context).pushNamed('/timecards'),
          ),
          ListTile(
            leading: Icon(Icons.group, color: Colors.blue),
            title: Text('Facilities'),
            onTap: () =>  Navigator.of(context).pushNamed('/facilities'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded, color: Colors.blue),
            title: Text('Users'),
            onTap: () => Navigator.of(context).pushNamed('/users'),
          ),
          ListTile(
            leading: Icon(Icons.picture_as_pdf, color: Colors.blue),
            title: Text('Reports'),
            onTap: () => Navigator.of(context).pushNamed('/reports'),
          ),
          ListTile(
            leading: Icon(Icons.phone_callback_outlined, color: Colors.blue),
            title: Text('Call out'),
            enabled: false,
            onTap: () => {
              print("Click Call out"),
            }
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              title: Text('Settings'),
              enabled: true,
              onTap: () => Navigator.of(context).pushNamed('/settings'),
          ),
          ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.red),
          title: Text('Exit'),
          enabled: true,
          onTap: () => {
            _storageService.deleteAllSecureData(),
              Navigator.of(context).pushNamed('/')
          }
          ),
        ],
      )
    );
  }
}
