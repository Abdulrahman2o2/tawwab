# تَوَّاب (Tawwab)

تطبيق إسلامي مجاني بالكامل — لا يحتوي على أي إعلانات أو مدفوعات.

## الميزات

- **🕌 الصلاة** — مواقيت الصلاة المحسوبة من موقعك الفعلي (طريقة الحساب المصرية)
- **📖 القرآن الكريم** — الـ 114 سورة كاملة مع النص العثماني (من api.alquran.cloud)
- **📿 التسبيح العالمي** — عداد تسبيح مع اهتزاز، حفظ دائم، واختيار من 6 أذكار + ترتيب
- **✨ الأذكار** — أذكار الصباح والمساء وبعد الصلاة والنوم (من حصن المسلم)
- **⚖️ ذنبي** — اختيار الذنب وعرض خطوات التوبة والكفارة وتصحيح الحقوق

## الهوية

- **الاسم:** تَوَّاب — من أسماء الله الحسنى (ٱللَّهُ ٱلتَّوَّابُ)
- **اللون الأساسي:** Teal `#14524D` + Gold `#C9A24B`
- **اللوجو:** ميزان بكفتين + هلال (يرمز للتوازن والصعود)

## التقنية

- **Flutter** (Dart)
- **State Management:** Riverpod
- **Navigation:** go_router
- **Prayer Times:** adhan + geolocator
- **Quran Text:** api.alquran.cloud (Uthmani)
- **Persistence:** shared_preferences

## Bundle ID
- iOS: `com.tawwab.app`
- Android: `com.tawwab.app`

## CI/CD

### Codemagic (iOS → TestFlight)
1. سجّل في [codemagic.io](https://codemagic.io/signup) باستخدام GitHub
2. أضف repo `Abdulrahman2o2/tawwab` كتطبيق جديد
3. اضبط متغيرات البيئة (انظر `codemagic.yaml`)
4. عند push إلى `main`، سيُبنى التطبيق ويُرفع على TestFlight تلقائياً

### GitHub Actions (Android APK)
- يعمل تلقائياً عند push إلى `main`
- ينتج APK جاهز للتثبيت

### Fastlane (بديل/يدوي)
```bash
cd ios && fastlane beta
```

## البناء المحلي

```bash
# Set JAVA_HOME to JDK 17
export JAVA_HOME=/path/to/jdk17

# Android APK
flutter build apk --release

# iOS IPA (يتطلب macOS + Xcode)
flutter build ipa --release --export-options-plist=ios/ExportOptions.plist
```

## الخصوصية
انظر [PRIVACY.md](PRIVACY.md) — التطبيق لا يجمع أي بيانات شخصية.

## License
Free — حسنات فقط.

---

GitHub: [Abdulrahman2o2/tawwab](https://github.com/Abdulrahman2o2/tawwab)
