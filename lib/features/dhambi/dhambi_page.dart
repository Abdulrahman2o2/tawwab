import 'package:flutter/material.dart';

import '../../app/colors.dart';
import 'sin_catalog.dart';

/// "Dhambi" (ذنبي) — My Sin / repentance companion.
/// The user acknowledges a sin and is shown the path to expiation (kaffarah)
/// and the steps toward sincere repentance (tawbah).
class DhambiPage extends StatelessWidget {
  const DhambiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ذنبي')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _IntroBanner(),
          const SizedBox(height: 16),
          Text('اختر الذنب',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: TawwabColors.ink,
                  )),
          const SizedBox(height: 8),
          for (final s in sinCatalog)
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Icon(s.icon, color: s.color),
                title: Text(s.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text(s.tags.join(' · '), style: const TextStyle(fontSize: 12)),
                trailing: const Icon(Icons.chevron_left, color: TawwabColors.muted),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => SinDetailPage(sin: s)),
                ),
              ),
            ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

/// Full repentance flow for a selected sin.
class SinDetailPage extends StatelessWidget {
  final SinItem sin;
  const SinDetailPage({super.key, required this.sin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(sin.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _RightsBanner(hint: sin.rightsHint),
          const SizedBox(height: 12),
          _SectionCard(
            icon: Icons.flag,
            title: 'خطوات التوبة',
            children: [
              for (final step in sin.tawbahSteps)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.check_circle_outline,
                          size: 18, color: TawwabColors.success),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(step,
                            style: const TextStyle(height: 1.5, fontSize: 14)),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          _SectionCard(
            icon: Icons.balance,
            title: 'الكفارة والتصحيح',
            children: [
              Text(sin.expiation,
                  style: const TextStyle(height: 1.7, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 12),
          _EncouragementCard(text: sin.encouragement),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _IntroBanner extends StatelessWidget {
  const _IntroBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [TawwabColors.primary, TawwabColors.primaryDeep],
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('قُلْ يَا عِبَادِيَ الَّذِينَ أَسْرَفُوا عَلَىٰ أَنفُسِهِمْ',
              style: TextStyle(
                  color: TawwabColors.accentSoft,
                  fontSize: 15,
                  fontWeight: FontWeight.w600)),
          SizedBox(height: 6),
          Text('لَا تَقْنَطُوا مِن رَّحْمَةِ اللَّهِ ۚ إِنَّ اللَّهَ يَغْفِرُ الذُّنُوبَ جَمِيعًا',
              style: TextStyle(color: Colors.white, fontSize: 15, height: 1.6)),
          SizedBox(height: 8),
          Text('— الزمر 53',
              style: TextStyle(color: TawwabColors.accentSoft, fontSize: 12)),
        ],
      ),
    );
  }
}

class _RightsBanner extends StatelessWidget {
  final String hint;
  const _RightsBanner({required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: TawwabColors.error.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: TawwabColors.error.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, color: TawwabColors.error, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(hint,
                style: const TextStyle(fontSize: 13, height: 1.5)),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;
  const _SectionCard({required this.icon, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(icon, color: TawwabColors.accent),
              const SizedBox(width: 8),
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700)),
            ]),
            const SizedBox(height: 14),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _EncouragementCard extends StatelessWidget {
  final String text;
  const _EncouragementCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: TawwabColors.accentSoft.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 15,
              height: 1.8,
              fontWeight: FontWeight.w600,
              color: TawwabColors.primary)),
    );
  }
}
