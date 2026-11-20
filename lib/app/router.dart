import 'package:go_router/go_router.dart';

import '../features/home/home_shell.dart';
import '../features/prayer/prayer_page.dart';
import '../features/quran/quran_page.dart';
import '../features/tasbeeh/tasbeeh_page.dart';
import '../features/azkar/azkar_page.dart';
import '../features/dhambi/dhambi_page.dart';

/// App navigation: a 5-tab bottom-nav shell.
/// Tabs: Prayer · Quran · Tasbeeh (Global) · Azkar · Dhambi
final GoRouter tawwabRouter = GoRouter(
  initialLocation: '/prayer',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          HomeShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [GoRoute(path: '/prayer', builder: (c, s) => const PrayerPage())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/quran', builder: (c, s) => const QuranPage())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/tasbeeh', builder: (c, s) => const TasbeehPage())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/azkar', builder: (c, s) => const AzkarPage())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/dhambi', builder: (c, s) => const DhambiPage())],
        ),
      ],
    ),
  ],
);
