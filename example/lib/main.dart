import 'package:flutter/material.dart';
import 'package:banners/banners.dart';

import 'banners.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BannerBackend(
      child: MaterialApp(
        routes: {
          '/': (_) => FirstPage(),
          '/second': (_) => SecondPage(),
        },
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Banners(
      child: Scaffold(
        appBar: AppBar(title: Text('First page')),
        body: Buttons(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/second'),
          child: Icon(Icons.beach_access),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Banners(
      child: Scaffold(
        appBar: AppBar(title: Text('Second page')),
        body: Buttons(),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () => context.banners.add(DemoBanner()),
            child: Text('Sign in as demo'),
          ),
          RaisedButton(
            onPressed: () => context.banners.remove(DemoBanner()),
            child: Text('Sign out from demo'),
          ),
          RaisedButton(
            onPressed: () => context.banners.add(OfflineBanner()),
            child: Text('Go offline'),
          ),
          RaisedButton(
            onPressed: () => context.banners.remove(OfflineBanner()),
            child: Text('Go online'),
          ),
        ],
      ),
    );
  }
}
