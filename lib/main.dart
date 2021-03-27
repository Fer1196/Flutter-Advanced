import 'package:band_name/pages/home.dart';
import 'package:band_name/pages/status.dart';
import 'package:band_name/services/socket_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ( _ ) => SocketService() ,)

        ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home':(_)=>HomePage(), 
          'status':(_)=>StatusPage()
        },
      ),
    );
  }
}

