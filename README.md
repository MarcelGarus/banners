Often, you want to be able to dynamically display banners at the top of the screen.
This package offers this functionality.

## How to use

### Create banners

Create some banner `Widget`s.
Use the `BannerScaffold` for automatically setting a color and respecting the status bar padding.

```dart
/// Indicates the user is using a demo account.
class DemoBanner extends StatelessWidget {
  Key get key => ValueKey('demo');

  @override
  Widget build(BuildContext context) {
    return BannerScaffold(
      backgroundColor: Colors.yellow,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Text('This is a demo account.'),
      ),
    );
  }
}
```

### Use banners

Wrap a widget with `Bannered` and provide the banner widgets. The `MediaQuery`'s `padding` will be adjusted correctly.

```dart
return Bannered(
  banners: [
    // Some banner widgets.
  ],
  child: Scaffold(...),
);
```
