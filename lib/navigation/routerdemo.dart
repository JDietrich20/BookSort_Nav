import 'package:Homework4/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:Homework4/pages/router_demo_pages/router_home.dart';
import 'package:Homework4/pages/router_demo_pages/router_login.dart';
import 'package:Homework4/pages/router_demo_pages/router_profile_page.dart';
import 'package:Homework4/pages/router_demo_pages/router_detailAuthor.dart';
import 'package:Homework4/pages/router_demo_pages/router_sortedByAuthor_page.dart';
import 'package:Homework4/pages/router_demo_pages/router_sortedByTitle_page.dart';
import 'package:Homework4/utilities/stream_to_listenable.dart';
import 'package:Homework4/widgets/navBar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/router_demo_pages/router_detailTitle.dart';

class RouteName {
  static const home = "home";
  static const login = "login";
  static const profile = "profile";
  static const bookDetailAuthor = "bookDetailAuthor";
  static const bookDetailTitle = "bookDetailTitle";
  static const title = 'byTitle';
  static const author = "byAuthor";
}

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "Root");
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "Shell");

GoRouter routerDemo(AuthenticationBloc authenticationBloc) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/byAuthor',
    refreshListenable: StreamToListenable([authenticationBloc.stream]),
    redirect: (context, state) async {
      if (authenticationBloc.state is AuthenticationLoggedOut &&
          (!(state.fullPath?.startsWith("/login") ?? false))) {
        return "/login";
      } else {
        if ((state.fullPath?.startsWith("/login") ?? false) &&
            authenticationBloc.state is AuthenticationLoggedIn) {
          return "/byAuthor";
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: RouteName.login,
        builder: (context, state) {
          return const RouterLogin();
        },
      ),
      GoRoute(
          path: '/',
          name: RouteName.home,
          builder: (context, state) {
            return const RouterHome();
          },
          routes: [
            ShellRoute(
              navigatorKey: shellNavigatorKey,
              builder:
                  (BuildContext context, GoRouterState state, Widget child) {
                return ScaffoldWithNavBar(child: child);
              },
              routes: <RouteBase>[
                GoRoute(
                    path: 'byAuthor',
                    name: RouteName.author,
                    builder: (BuildContext context, GoRouterState state) {
                      return const SortedByAuthorPage();
                    },
                    routes: [
                      GoRoute(
                        path: 'byAuthorDetail',
                        name: RouteName.bookDetailAuthor,
                        parentNavigatorKey: rootNavigatorKey,
                        builder: (BuildContext context, GoRouterState state) {
                          return const BookByAuthor();
                        },
                      )
                    ]),
                GoRoute(
                    path: 'byTitle',
                    name: RouteName.title,
                    builder: (BuildContext context, GoRouterState state) {
                      return const SortedByTitlePage();
                    },
                    routes: [
                      GoRoute(
                        path: 'byTitleDetail',
                        name: RouteName.bookDetailTitle,
                        parentNavigatorKey: rootNavigatorKey,
                        builder: (BuildContext context, GoRouterState state) {
                          return const BookByTitle();
                        },
                      )
                    ]),
                GoRoute(
                  path: 'profile',
                  name: RouteName.profile,
                  builder: (BuildContext context, GoRouterState state) {
                    return const RouterProfile();
                  },
                ),
              ],
            )
          ]),
    ],
  );
}
