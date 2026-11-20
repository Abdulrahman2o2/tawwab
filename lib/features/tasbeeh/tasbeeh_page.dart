import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

import '../../app/colors.dart';

/// Global Tasbeeh tab.
/// Counts the user's dhikr/tasbeeh and feeds the worldwide ranking.
/// Persisted locally; the backend leaderboard arrives later.
class TasbeehPage extends ConsumerStatefulWidget {
  const TasbeehPage({super.key});

  @override
  ConsumerState<TasbeehPage> createState() => _TasbeehPageState();
}

class _TasbeehPageState extends ConsumerState<TasbeehPage> {
  int _count = 0;
  int _lifetime = 0;
  int _dhikrIndex = 0;

  static const _dhikrOptions = <String>[
    'سُبْحَانَ اللَّهِ',
    'الْحَمْدُ للَّهِ',
    'اللَّهُ أَكْبَرُ',
    'لَا إِلَهَ إِلَّا اللَّهُ',
    'أَسْتَغْفِرُ اللَّهَ',
    'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
  ];

  @override
  void initState() {
    super.initState();
    _loadSaved();
  }

  Future<void> _loadSaved() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _count = prefs.getInt('tasbeeh_count') ?? 0;
      _lifetime = prefs.getInt('tasbeeh_lifetime') ?? 0;
      _dhikrIndex = prefs.getInt('tasbeeh_dhikr') ?? 0;
    });
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('tasbeeh_count', _count);
    await prefs.setInt('tasbeeh_lifetime', _lifetime);
    await prefs.setInt('tasbeeh_dhikr', _dhikrIndex);
  }

  void _increment() {
    setState(() {
      _count++;
      _lifetime++;
    });
    Vibration.hasVibrator().then((has) {
      if (has == true) Vibration.vibrate(duration: 18);
    });
    _persist();
  }

  void _reset() {
    setState(() => _count = 0);
    _persist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('التسبيح العالمي')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _RankCard(lifetime: _lifetime),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  for (int i = 0; i < _dhikrOptions.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        label: Text(_dhikrOptions[i],
                            style: const TextStyle(fontSize: 13)),
                        selected: _dhikrIndex == i,
                        onSelected: (_) {
                          setState(() => _dhikrIndex = i);
                          _persist();
                        },
                      ),
                    ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: _increment,
              child: Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [TawwabColors.primaryLight, TawwabColors.primaryDeep],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: TawwabColors.primary.withValues(alpha: 0.3),
                      blurRadius: 30,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$_count',
                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('اضغط للتسبيح',
                        style: TextStyle(color: TawwabColors.accentSoft)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _dhikrOptions[_dhikrIndex],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: TawwabColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text('إجمالي تسبيحك: $_lifetime',
                style: const TextStyle(color: TawwabColors.muted, fontSize: 13)),
            const SizedBox(height: 8),
            if (_count > 0)
              TextButton.icon(
                onPressed: _reset,
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('إعادة العد'),
              ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _RankCard extends StatelessWidget {
  final int lifetime;
  const _RankCard({required this.lifetime});

  @override
  Widget build(BuildContext context) {
    final place = _estimatePlace(lifetime);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 26,
              backgroundColor: TawwabColors.accentSoft,
              child: Icon(Icons.emoji_events,
                  color: TawwabColors.accent, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ترتيبك اليوم',
                      style:
                          TextStyle(color: TawwabColors.muted, fontSize: 13)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text('#$place',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: TawwabColors.primary,
                              )),
                      const SizedBox(width: 8),
                      const Text('عالمياً',
                          style: TextStyle(color: TawwabColors.muted)),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text('يتم تحديث الترتيب مع اكتمال النظام العالمي',
                      style: TextStyle(
                          color: TawwabColors.muted, fontSize: 11)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _estimatePlace(int lifetime) {
    if (lifetime == 0) return '-';
    if (lifetime < 100) return (10000 - lifetime).toString();
    if (lifetime < 1000) return (5000 - lifetime ~/ 10).toString();
    return (1000 - lifetime ~/ 100).toString();
  }
}
