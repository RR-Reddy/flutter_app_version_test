import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _msg = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          RaisedButton(
            onPressed: () => _onTap(context),
            child: Text('tap'),
          ),
          Text(_msg),
        ],
      ),
    ));
  }

  void _onTap(BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    print('packageInfo appName ${packageInfo.appName}');
    print('packageInfo packageName ${packageInfo.packageName}');
    print('packageInfo version ${packageInfo.version}');
    print('packageInfo buildNumber ${packageInfo.buildNumber}');

    setState(() {
      _msg =
          "appName ${packageInfo.appName} \n packageName ${packageInfo.packageName} \n version ${packageInfo.version} \n buildNumber ${packageInfo.buildNumber}";
    });
  }
}
