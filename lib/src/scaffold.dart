import 'package:flutter/material.dart';

class BannerScaffold extends StatelessWidget {
  const BannerScaffold({
    Key? key,
    required this.backgroundColor,
    required this.body,
  }) : super(key: key);

  final Color backgroundColor;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Material(color: backgroundColor, child: SafeArea(child: body));
  }
}
