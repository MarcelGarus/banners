import 'package:flutter/material.dart';
import 'package:banners/banners.dart';

import 'banners.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThePage(),
    );
  }
}

class ThePage extends StatefulWidget {
  @override
  _ThePageState createState() => _ThePageState();
}

class _ThePageState extends State<ThePage> {
  final _banners = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Bannered(
      banners: _banners,
      child: Scaffold(
        appBar: AppBar(title: Text('First page')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () => setState(() => _banners.add(DemoBanner())),
                child: Text('Sign in as demo'),
              ),
              RaisedButton(
                onPressed: () => setState(() => _banners.remove(DemoBanner())),
                child: Text('Sign out from demo'),
              ),
              RaisedButton(
                onPressed: () => setState(() => _banners.add(OfflineBanner())),
                child: Text('Go offline'),
              ),
              RaisedButton(
                onPressed: () =>
                    setState(() => _banners.remove(OfflineBanner())),
                child: Text('Go online'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
