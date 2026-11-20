import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/router.dart';
import 'app/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: TawwabApp()));
}

class TawwabApp extends StatelessWidget {
  const TawwabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'توّاب',
      debugShowCheckedModeBanner: false,
      theme: TawwabTheme.light(),
      darkTheme: TawwabTheme.dark(),
      routerConfig: tawwabRouter,
    );
  }
}
