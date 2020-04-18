import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

class BannerBackend extends StatefulWidget {
  BannerBackend({Key key, this.child}) : assert(child != null);

  final Widget child;

  @override
  BannerBackendState createState() => BannerBackendState();
}

class BannerBackendState extends State<BannerBackend> {
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
    return BannerService(
      banners: _banners.values.toList(),
      add: _add,
      remove: _remove,
      child: widget.child,
    );
  }
}

class BannerService extends InheritedWidget {
  BannerService({
    @required this.banners,
    @required this.add,
    @required this.remove,
    @required Widget child,
  }) : super(child: child);

  final List<Widget> banners;
  final void Function(Widget banner) add;
  final void Function(Widget banner) remove;

  @override
  bool updateShouldNotify(BannerService oldWidget) =>
      !DeepCollectionEquality().equals(banners, oldWidget.banners);
}

extension GetBannerService on BuildContext {
  BannerService get banners =>
      dependOnInheritedWidgetOfExactType<BannerService>() ??
      (throw Exception(
          "It seems like no BannerService exists above the context that you "
          "called context.banners on. You should probably wrap your app in a "
          "BannerService for this to work."));
}
