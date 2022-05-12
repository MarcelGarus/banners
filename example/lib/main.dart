import 'package:banners/banners.dart';
import 'package:flutter/material.dart';

import 'banners.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext _) => MaterialApp(home: ThePage());
}

class ThePage extends StatefulWidget {
  @override
  State<ThePage> createState() => _ThePageState();
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
              ElevatedButton(
                onPressed: () => setState(() => _banners.add(DemoBanner())),
                child: Text('Sign in as demo'),
              ),
              ElevatedButton(
                onPressed: () => setState(() => _banners.remove(DemoBanner())),
                child: Text('Sign out from demo'),
              ),
              ElevatedButton(
                onPressed: () => setState(() => _banners.add(OfflineBanner())),
                child: Text('Go offline'),
              ),
              ElevatedButton(
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
