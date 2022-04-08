part of 'const.dart';

const primaryColor = Color(0xFFd13a74);
const subPrimaryColor = Color(0xFFf77a37);

const defaultSystemUiOverlayStyle = SystemUiOverlayStyle(
  // The color of the system bottom navigation bar.
  // Only honored in Android versions O and greater.
  systemNavigationBarColor: Colors.white,
  // The color of the divider between the system's bottom navigation bar and the app's content.
  // Only honored in Android versions P and greater.
  systemNavigationBarDividerColor: Colors.white,
  // The brightness of the system navigation bar icons.
  // Only honored in Android versions O and greater.
  // When set to [Brightness.light], the system navigation bar icons are light.
  // When set to [Brightness.dark], the system navigation bar icons are dark.
  systemNavigationBarIconBrightness: Brightness.dark,
  // The color of top status bar.
  // Only honored in Android version M and greater.
  statusBarColor: Colors.transparent,
  // The brightness of top status bar.
  // Only honored in iOS.
  statusBarBrightness: Brightness.dark,
  // The brightness of the top status bar icons.
  // Only honored in Android version M and greater.
  statusBarIconBrightness: Brightness.light,
);