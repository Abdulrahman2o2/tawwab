import 'package:flutter/material.dart';

import '../../app/colors.dart';
import 'azkar_data.dart';

/// Azkar & Duas tab — real content from Hisn al-Muslim.
class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الأذكار والأدعية')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final c in azkarData)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: Icon(_iconFor(c.id), color: TawwabColors.accent),
                title: Text(c.title,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text('${c.items.length} ذكر',
                    style: const TextStyle(fontSize: 12)),
                trailing:
                    const Icon(Icons.chevron_left, color: TawwabColors.muted),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => AzkarDetailPage(category: c)),
                ),
              ),
            ),
        ],
      ),
    );
  }

  static IconData _iconFor(String id) {
    switch (id) {
      case 'morning':
        return Icons.wb_sunny_outlined;
      case 'evening':
        return Icons.nights_stay_outlined;
      case 'after_prayer':
        return Icons.access_time;
      case 'sleep':
        return Icons.bedtime_outlined;
      default:
        return Icons.auto_awesome_outlined;
    }
  }
}

class AzkarDetailPage extends StatelessWidget {
  final AzkarCategory category;
  const AzkarDetailPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: category.items.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final item = category.items[i];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.text,
                      style: const TextStyle(
                          fontSize: 17, height: 1.9, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      if (item.source != null) ...[
                        Icon(Icons.menu_book_outlined,
                            size: 14, color: TawwabColors.muted),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(item.source!,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: TawwabColors.muted,
                                  fontStyle: FontStyle.italic)),
                        ),
                      ] else
                        const Spacer(),
                      if (item.repeat > 1)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: TawwabColors.accentSoft.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text('×${item.repeat}',
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: TawwabColors.primary)),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
