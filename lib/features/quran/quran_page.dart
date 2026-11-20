import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../app/colors.dart';
import 'surah_list.dart';

/// Quran tab — surah list + full text fetched from api.alquran.cloud.
class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('القرآن الكريم')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ابحث عن سورة…',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                isDense: true,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              itemCount: surahList.length,
              separatorBuilder: (_, _) => const SizedBox(height: 6),
              itemBuilder: (context, i) {
                final s = surahList[i];
                return Card(
                  margin: EdgeInsets.zero,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 18,
                      backgroundColor: TawwabColors.accentSoft.withValues(alpha: 0.35),
                      child: Text('${s.number}',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: TawwabColors.primary)),
                    ),
                    title: Text(s.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17)),
                    subtitle: Text(
                        '${s.ayahs} آية · ${s.meccan ? 'مكية' : 'مدنية'}',
                        style: const TextStyle(fontSize: 12)),
                    trailing: const Icon(Icons.chevron_left,
                        color: TawwabColors.muted),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => SurahReaderPage(surah: s)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Reads a full surah from api.alquran.cloud (Uthmani text).
class SurahReaderPage extends StatefulWidget {
  final Surah surah;
  const SurahReaderPage({super.key, required this.surah});

  @override
  State<SurahReaderPage> createState() => _SurahReaderPageState();
}

class _SurahReaderPageState extends State<SurahReaderPage> {
  List<String>? _ayahs;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _error = null);
    try {
      final res = await http.get(Uri.parse(
          'https://api.alquran.cloud/v1/surah/${widget.surah.number}/quran-uthmani'));
      if (res.statusCode != 200) throw Exception('HTTP ${res.statusCode}');
      final data = jsonDecode(utf8.decode(res.bodyBytes));
      final ayahs = (data['data']['ayahs'] as List)
          .map((a) => a['text'] as String)
          .toList();
      if (!mounted) return;
      setState(() => _ayahs = ayahs);
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = 'تعذّر تحميل السورة. تحقق من الاتصال بالإنترنت.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.surah.name)),
      body: _error != null
          ? _RetryView(error: _error!, onRetry: _load)
          : _ayahs == null
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    if (widget.surah.number != 1 && widget.surah.number != 9)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text('بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                height: 2,
                                fontWeight: FontWeight.w700,
                                color: TawwabColors.primary)),
                      ),
                    Text(
                      _ayahs!.join(' '),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 24,
                          height: 2.2,
                          color: TawwabColors.ink),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
    );
  }
}

class _RetryView extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;
  const _RetryView({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off, size: 48, color: TawwabColors.muted),
            const SizedBox(height: 16),
            Text(error, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: const Text('إعادة المحاولة')),
          ],
        ),
      ),
    );
  }
}
