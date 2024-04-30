import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  ModalRoute<dynamic>? get modalRoute => ModalRoute.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  ThemeData get theme => Theme.of(this);

  void dismissFocus() {
    final currentFocus = FocusScope.of(this);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void pop<T extends Object?>([T? result]) {
    final canPop = Navigator.canPop(this);
    if (!canPop) return;

    return Navigator.pop<T>(this, result);
  }

  bool get canPop => modalRoute?.canPop ?? false;

  Future<T?> push<T extends Object?>(
    Widget page, {
    bool fullscreenDialog = false,
    bool maintainState = true,
    String? name,
  }) async {
    final route = CupertinoPageRoute<T>(
      settings: RouteSettings(name: name ?? "${page.runtimeType}"),
      fullscreenDialog: fullscreenDialog,
      maintainState: maintainState,
      builder: (BuildContext context) => page,
    );

    return await Navigator.push<T>(this, route);
  }
}
