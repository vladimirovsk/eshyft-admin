import 'package:eshyftadmin/component/buttons.dart';
import 'package:eshyftadmin/screens/navbar.dart';
import 'package:eshyftadmin/services/storage_service.dart';
import 'package:flutter/material.dart';


import '../constants/main.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final StorageService _storageService = StorageService();

  late String _email;

  @override
  void initState() {
    _email  = '';
    // response.then((value) => {
    //   _email = value.toString(),
    //   print('RESPONSE '+value)
    // });
    // });
  //   print(storage.toString());
  //   if (!storage.getItem('accessToken')) {
  //     Navigator.of(context).pushNamed('/start-page');
  //   }
   }

   returnToLogin() async {

    //Navigator.of(context).pushNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBarScreen(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('Dashboard'),
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.view_headline_rounded)),
         actions: <Widget>[
           IconButton(onPressed: (){}, icon: Icon(Icons.account_box_rounded))
         ],
      ),
      backgroundColor: Constants.COLOR_PAPER,
      body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'Sign in',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu'),
              ),
              const SizedBox(height: 30),
              Container(child: EshyftButton('To Login', returnToLogin)),
              // Text(storage.getItem('accessToken')),
              // SizedBox(height: 30)
            ],
          )),
    );
  }
}
