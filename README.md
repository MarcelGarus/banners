Often, you want to be able to dynamically display banners at the top of the screen.
This package offers this functionality.

## How to use

### 1. Wrap your existing app inside a `BannerService`

```dart
return BannerService(
  child: MaterialApp(...),
);
```

### 2. Wrap each screen in a `Banners` widget

```dart
return Banners(
  child: Scaffold(...),
);
```

### 3. Create some banners

Any widgets with a key can be banners.
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

The same banner cannot be displayed twice, e.g. there can only exist one banner with the `ValueKey('demo')` key at a time.

### 4. Use banners

Anywhere in your app, call `context.banners.add(DemoBanner())` to show a banner.
Similarly, you can call `context.banners.remove(DemoBanner())` to remove the banner.

```dart
Future<void> loginAsDemo(BuildContext context) async {
  await login(username: 'demo', password: 'demo');
  context.banners.add(DemoBanner());
}

Future<void> logout(BuildContext context) {
  context.banners.remove(DemoBanner()); // If no DemoBanner exists, nothing happens.
  ...
}
```
