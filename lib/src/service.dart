import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

class BannerService extends StatefulWidget {
  BannerService({Key key, this.child}) : assert(child != null);

  final Widget child;

  @override
  BannerServiceState createState() => BannerServiceState();
}

class BannerServiceState extends State<BannerService> {
  final _banners = <Key, Widget>{};

  void _add(Widget banner) {
    assert(banner.key != null,
        "Tried to add $banner as a banner, but it doesn't have a key.");
    setState(() => _banners.putIfAbsent(banner.key, () => banner));
  }

  void _remove(Widget banner) {
    assert(banner.key != null,
        "Tried to remove $banner as a banner, but it doesn't have a key.");
    setState(() => _banners.remove(banner.key));
  }

  @override
  Widget build(BuildContext context) {
    return BannerState(
      banners: _banners.values.toList(),
      add: _add,
      remove: _remove,
      child: widget.child,
    );
  }
}

class BannerState extends InheritedWidget {
  BannerState({
    @required this.banners,
    @required this.add,
    @required this.remove,
    @required Widget child,
  }) : super(child: child);

  final List<Widget> banners;
  final void Function(Widget banner) add;
  final void Function(Widget banner) remove;

  @override
  bool updateShouldNotify(BannerState oldWidget) =>
      !DeepCollectionEquality().equals(banners, oldWidget.banners);
}

extension GetBannerState on BuildContext {
  BannerState get banners =>
      dependOnInheritedWidgetOfExactType<BannerState>() ??
      (throw Exception(
          "It seems like no BannerService exists above the context that you "
          "called context.banners on. You should probably wrap your app in a "
          "BannerService for this to work."));
}
