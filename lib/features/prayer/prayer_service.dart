import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';

/// Computes real prayer times from the device location.
class PrayerService {
  /// Returns today's prayer times, or null if location is unavailable.
  static Future<PrayerTimes?> today() async {
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return null;
      }
      final pos = await Geolocator.getCurrentPosition();
      final now = DateTime.now();
      final params = CalculationMethod.egyptian.getParameters();
      final times = PrayerTimes(
        Coordinates(pos.latitude, pos.longitude),
        DateComponents(now.year, now.month, now.day),
        params,
      );
      return times;
    } catch (_) {
      return null;
    }
  }

  static String format(DateTime? t) {
    if (t == null) return '--:--';
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
