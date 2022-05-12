import 'package:flutter/material.dart';

class BannerScaffold extends StatelessWidget {
  const BannerScaffold({
    super.key,
    required this.backgroundColor,
    required this.body,
  });

  final Color backgroundColor;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Material(color: backgroundColor, child: SafeArea(child: body));
  }
}
