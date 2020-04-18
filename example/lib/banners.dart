import 'package:banners/banners.dart';
import 'package:flutter/material.dart';

class DemoBanner extends StatelessWidget {
  Key get key => ValueKey('demo');

  @override
  Widget build(BuildContext context) {
    return BannerScaffold(
      backgroundColor: Colors.orange,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Text('This is a demo account.'),
      ),
    );
  }
}

class OfflineBanner extends StatelessWidget {
  Key get key => ValueKey('offline');

  @override
  Widget build(BuildContext context) {
    return BannerScaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Text("You're offline.", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
