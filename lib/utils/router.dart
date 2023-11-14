import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quantomail/src/screens/home.dart';
import 'package:quantomail/src/screens/main_wrapper.dart';

CustomTransitionPage withCustomAnimation(
    GoRouterState state, Widget child, int selectedIndex) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: MainWrapper(
      selectedIndex: selectedIndex,
      child: child,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}

final routerList = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return withCustomAnimation(state, const HomePage(), 0);
      },
    ),
  ],
);
