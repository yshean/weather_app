import 'package:flutter/material.dart';
import 'package:weather_app/home_page.dart';
import 'package:weather_app/manage_city_page.dart';
import 'package:weather_app/unknown_page.dart';

void main() {
  runApp(MyApp());
}

abstract class Routes {
  static const validPaths = [manageCity];

  static const manageCity = 'manage-city';
}

// Reference: https://techblog.geekyants.com/navigation-20-routing-on-flutter-web

class MyRoutePath {
  /// The URL param after "/"
  final String pathName;

  /// To control whether showing unknown page in case of invalid URL
  final bool isUnknown;

  /// Shows the initial screen when the route is "/"
  MyRoutePath.home()
      : pathName = '',
        isUnknown = false;

  MyRoutePath.otherPage(this.pathName) : isUnknown = false;

  MyRoutePath.unknown()
      : pathName = '',
        isUnknown = true;

  bool get isHomePage => pathName.isEmpty;
  bool get isOtherPage => pathName.isNotEmpty;
}

class MyRouteInformationParser extends RouteInformationParser<MyRoutePath> {
  /// To parse and convert a URL path into a MyRoutePath
  @override
  Future<MyRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    // after "/" it has zero pathSegments
    if (uri.pathSegments.length == 0) {
      return MyRoutePath.home();
    }

    // after "/" it has 1 pathSegment, e.g. /abc
    if (uri.pathSegments.length == 1) {
      final pathName = uri.pathSegments.elementAt(0).toString();
      return MyRoutePath.otherPage(pathName);
    }

    return MyRoutePath.unknown();
  }

  /// To store the browsing history in the browser
  @override
  RouteInformation? restoreRouteInformation(MyRoutePath myRoutePath) {
    if (myRoutePath.isUnknown) return RouteInformation(location: '/error');
    if (myRoutePath.isHomePage) return RouteInformation(location: '/');
    if (myRoutePath.isOtherPage)
      return RouteInformation(location: '/${myRoutePath.pathName}');
    return null;
  }
}

class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  final LinearGradient backgroundGradient;

  String pathName = '';
  bool isError = false;

  MyRouterDelegate({required this.backgroundGradient});

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  /// This is called by the [Router] when it detects a route information may have changed due to a rebuild
  /// To call MyRoutePath constructors based on conditions
  @override
  MyRoutePath? get currentConfiguration {
    if (isError) return MyRoutePath.unknown();
    if (pathName.isEmpty) return MyRoutePath.home();
    return MyRoutePath.otherPage(pathName);
  }

  /// Actually call this method to navigate within app
  void navigateTo(String path) {
    pathName = path;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        HomePage(
          backgroundGradient: backgroundGradient,
          onTapped: navigateTo,
        ),
        if (pathName == Routes.manageCity)
          ManageCityPage()
        else if (isError)
          UnknownPage()
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;

        pathName = '';
        isError = false;
        notifyListeners();

        return true;
      },
    );
  }

  /// Handles the routing when user enters URL in the browser and presses enter
  @override
  Future<void> setNewRoutePath(MyRoutePath myRoutePath) async {
    if (myRoutePath.isHomePage) {
      pathName = '';
      isError = false;
      return;
    }

    if (myRoutePath.isUnknown) {
      pathName = '';
      isError = true;
      return;
    }

    if (myRoutePath.isOtherPage) {
      pathName = myRoutePath.pathName;
      if (Routes.validPaths.contains(pathName)) {
        isError = false;
      } else {
        isError = true;
      }
    }
  }
}

class MyApp extends StatelessWidget {
  static const purple = Color.fromRGBO(100, 12, 170, 1);
  static const blue = Color.fromRGBO(0, 9, 234, 0.79);
  static const backgroundGradient = LinearGradient(
    colors: [
      purple,
      blue,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      routeInformationParser: MyRouteInformationParser(),
      routerDelegate: MyRouterDelegate(backgroundGradient: backgroundGradient),
    );
  }
}
