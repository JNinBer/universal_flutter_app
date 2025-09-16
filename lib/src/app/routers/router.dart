import 'package:catcher/catcher.dart';
import 'package:go_router/go_router.dart';

import '../../module/home/home_page.dart';

final router = GoRouter(
  navigatorKey: Catcher.navigatorKey,
  redirect: (context, state) {
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
