import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:inngage_plugin/inapp/inapp_widget.dart';
import 'package:inngage_plugin/inapp/inngage_inapp.dart';
import 'package:inngage_plugin/inngage_plugin.dart';
import 'main.dart';
import 'home_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  initSdk() async {
    final json = {
      "nome": "User 01",
      "dt_nascimento": "01/09/1970",
      "genero": "M",
      "cartao": "N",
      "ultimo_abastecimento": "10/09/2018",
      "total_abastecido": "290,00"
    };

    final inngageWebViewProperties = InngageWebViewProperties(
      appBarColor: Colors.pink,
      appBarText: Text(
        'AppTitle',
      ),
      backgroundColor: Colors.white,
      loaderColor: Colors.pink,
      debuggingEnabled: true,
      withJavascript: true,
      withLocalStorage: true,
      withZoom: true,
    );
    await InngageSDK.subscribe(
      appToken: '4d5c17ab9ae4ea7f5c989dc50c41bd7e',
      friendlyIdentifier: 'teste007@gmail.com',
      customFields: json,
      phoneNumber: '5511999999999',
      email: 'teste007@gmail.com',
      blockDeepLink: true,
      firebaseListenCallback: (data) => print(data['additional_data']),
      navigatorKey: navigatorKey,
      inngageWebViewProperties: inngageWebViewProperties,
      requestAdvertiserId: false,
    );
    InngageEvent.setDebugMode(true);
    InngageEvent.setUserPhone("5511999999999");
    await InngageEvent.sendEvent(
      eventName: 'MyOtherEventWithoutEventValues',
      appToken: '4d5c17ab9ae4ea7f5c989dc50c41bd7e',
      identifier: 'teste007@gmail.com',
      eventValues: {
        'location': '12312312312',
      },
    );
    await InngageEvent.sendEvent(
      eventName: 'send_test',
      appToken: '4d5c17ab9ae4ea7f5c989dc50c41bd7e',
      registration: 'teste007@gmail.com',
    );
    InngageInapp.blockDeepLink = true;
    InngageInapp.deepLinkCallback = (link){
      print('link:' + link);
    };
  }

  @override
  void initState() {
    super.initState();

    initSdk();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: InngageInAppWidget(child: HomePage()),
    );
  }
}
