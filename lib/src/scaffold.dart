import 'package:flutter/material.dart';

class BannerScaffold extends StatelessWidget {
  const BannerScaffold({
    Key key,
    this.backgroundColor,
    this.background,
    @required this.body,
  }) : super(key: key);

  final Color backgroundColor;
  final Widget background;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: SafeArea(
        child: body,
      ),
    );
  }
}
