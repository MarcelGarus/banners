import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const _childKey = ValueKey('child');

class Bannered extends StatelessWidget {
  const Bannered({
    Key key,
    @required this.banners,
    @required this.child,
  }) : super(key: key);

  final List<Widget> banners;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          for (var i = 0; i < banners.length; i++)
            MediaQuery.removePadding(
              context: context,
              removeTop: i > 0,
              removeBottom: true,
              child: SizedBox(width: double.infinity, child: banners[i]),
            ),
          MediaQuery.removePadding(
            context: context,
            removeTop: banners.isNotEmpty,
            child: Expanded(key: _childKey, child: child),
          ),
        ],
      ),
    );
  }
}
