import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hijri/hijri_calendar.dart';

import '../../app/colors.dart';
import 'prayer_service.dart';
import 'package:adhan/adhan.dart';

/// Prayer-times home tab — real calculation via `adhan` + device location.
class PrayerPage extends ConsumerStatefulWidget {
  const PrayerPage({super.key});

  @override
  ConsumerState<PrayerPage> createState() => _PrayerPageState();
}

class _PrayerPageState extends ConsumerState<PrayerPage> {
  PrayerTimes? _times;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final t = await PrayerService.today();
    if (!mounted) return;
    setState(() {
      _times = t;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final today = HijriCalendar.now();
    final t = _times;

    final prayers = <_Prayer>[
      _Prayer('الفجر', PrayerService.format(t?.fajr), Icons.wb_twilight),
      _Prayer('الشروق', PrayerService.format(t?.sunrise), Icons.wb_sunny_outlined),
      _Prayer('الظهر', PrayerService.format(t?.dhuhr), Icons.wb_sunny),
      _Prayer('العصر', PrayerService.format(t?.asr), Icons.wb_sunny),
      _Prayer('المغرب', PrayerService.format(t?.maghrib), Icons.brightness_3_outlined),
      _Prayer('العشاء', PrayerService.format(t?.isha), Icons.nights_stay_outlined),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('الصلاة')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _HijriCard(today: today),
                const SizedBox(height: 12),
                Text('مواقيت الصلاة',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: TawwabColors.muted,
                          fontWeight: FontWeight.w600,
                        )),
                const SizedBox(height: 8),
                ...prayers.map((p) => _PrayerRow(prayer: p)),
                const SizedBox(height: 16),
                _LocationBanner(hasLocation: t != null),
              ],
            ),
    );
  }
}

class _HijriCard extends StatelessWidget {
  final HijriCalendar today;
  const _HijriCard({required this.today});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Icon(Icons.mosque, color: TawwabColors.accent, size: 36),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    today.toFormat("dd MMMM yyyy"),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 4),
                  const Text('التاريخ الهجري',
                      style: TextStyle(color: TawwabColors.muted)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrayerRow extends StatelessWidget {
  final _Prayer prayer;
  const _PrayerRow({required this.prayer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(prayer.icon, color: TawwabColors.primary),
        title: Text(prayer.name,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Text(prayer.time,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: TawwabColors.ink,
                )),
      ),
    );
  }
}

class _LocationBanner extends StatelessWidget {
  final bool hasLocation;
  const _LocationBanner({required this.hasLocation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: TawwabColors.accentSoft.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            hasLocation ? Icons.location_on : Icons.location_on_outlined,
            color: TawwabColors.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              hasLocation
                  ? 'تم حساب المواقيت من موقعك الحالي'
                  : 'لم نستطع تحديد موقعك — تُعرض مواقيت تقريبية. فعّل خدمة الموقع وأعد المحاولة.',
              style: const TextStyle(color: TawwabColors.ink, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class _Prayer {
  final String name;
  final String time;
  final IconData icon;
  const _Prayer(this.name, this.time, this.icon);
}
