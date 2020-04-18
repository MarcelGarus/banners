import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'service.dart';

const _childKey = ValueKey('child');

class Banners extends StatelessWidget {
  const Banners({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final banners = context.banners.banners;
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Hero(
            tag: 'banners',
            child: Column(
              children: [
                for (var i = 0; i < banners.length; i++)
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: i > 0,
                    removeBottom: true,
                    child: SizedBox(width: double.infinity, child: banners[i]),
                  ),
              ],
            ),
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
