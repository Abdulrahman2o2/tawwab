import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/colors.dart';

/// Root shell holding the 5-tab bottom navigation.
class HomeShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    const tabs = <_TabSpec>[
      _TabSpec(Icons.mosque_outlined, Icons.mosque, 'الصلاة'),
      _TabSpec(Icons.menu_book_outlined, Icons.menu_book, 'القرآن'),
      _TabSpec(Icons.change_circle_outlined, Icons.change_circle, 'التسبيح'),
      _TabSpec(Icons.auto_awesome_outlined, Icons.auto_awesome, 'الأذكار'),
      _TabSpec(Icons.balance_outlined, Icons.balance, 'ذنبي'),
    ];

    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        backgroundColor: scheme.surface,
        onDestinationSelected: (i) => navigationShell.goBranch(
          i,
          initialLocation: i == navigationShell.currentIndex,
        ),
        destinations: [
          for (final t in tabs)
            NavigationDestination(
              icon: Icon(t.outlined, color: TawwabColors.muted),
              selectedIcon: Icon(t.filled, color: TawwabColors.primary),
              label: t.label,
            ),
        ],
      ),
    );
  }
}

class _TabSpec {
  final IconData outlined;
  final IconData filled;
  final String label;
  const _TabSpec(this.outlined, this.filled, this.label);
}
