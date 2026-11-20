# تَوَّاب (Tawwab)

تطبيق إسلامي مجاني بالكامل — لا يحتوي على أي مدفوعات.

## الميزات

- **الصلاة** — مواقيت الصلاة المحسوبة من موقعك الفعلي (طريقة الحساب المصرية)
- **القرآن الكريم** — الـ 114 سورة كاملة مع النص العثماني (من api.alquran.cloud)
- **التسبيح العالمي** — عداد تسبيح مع اهتزاز، حفظ دائم، واختيار من 6 أذكار
- **الأذكار** — أذكار الصباح والمساء وبعد الصلاة والنوم (من حصن المسلم)
- **ذنبي** — اختيار الذنب وعرض خطوات التوبة والكفارة وتصحيح الحقوق

## الهوية

- **الاسم:** تَوَّاب — من أسماء الله الحسنى (ٱللَّهُ ٱلتَّوَّابُ)
- **اللون الأساسي:** Teal `#14524D` + Gold `#C9A24B`
- **اللوجو:** ميزان بكفتين + هلال (يرمز للتوازن والصعود)

## التقنية

- **Flutter** 3.44 (Dart 3.12)
- **State Management:** Riverpod
- **Navigation:** go_router
- **Prayer Times:** adhan + geolocator
- **Quran Text:** api.alquran.cloud (Uthmani)
- **Persistence:** shared_preferences

## Build

```bash
# Set JAVA_HOME to JDK 17
export JAVA_HOME=/path/to/jdk17

# Debug
flutter build apk --debug

# Release
flutter build apk --release
```

## Bundle ID
- iOS: `com.tawwab.app`
- Android: `com.tawwab.tawwab`

## License
Free — حسنات فقط.
