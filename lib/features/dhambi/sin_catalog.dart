import 'package:flutter/material.dart';

/// Curated repentance catalog for the "Dhambi" (ذنبي) page.
/// Content is fixed, curated text (no AI generation at runtime) so it stays
/// reliable and reviewable. Structure: sin → why it matters → path to tawbah
/// (conditions/steps) → expiation of rights (huquq) → encouragement (Qur'an/Sunnah).
class SinItem {
  final String id;
  final String title;          // Arabic name of the sin
  final IconData icon;
  final Color color;
  final String rightsHint;     // if rights of others are involved
  final List<String> tawbahSteps;   // steps toward sincere repentance
  final String expiation;      // what to do to expiate / make amends
  final String encouragement;  // supportive Qur'anic/scholarly reminder
  final List<String> tags;

  const SinItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
    required this.rightsHint,
    required this.tawbahSteps,
    required this.expiation,
    required this.encouragement,
    required this.tags,
  });
}

const sinCatalog = <SinItem>[
  SinItem(
    id: 'lying',
    title: 'الكذب',
    icon: Icons.record_voice_over,
    color: Color(0xFFB44545),
    rightsHint: 'إن تسبّب الكذب في ضرر لغيرك فالحقوق تُردّ.',
    tawbahSteps: [
      'الإقلاع عن الكذب فوراً والاستغفار',
      'الصدق في كل صغير وكبير بعد اليوم',
      'لا تتقبّل من نفسك "كذبة بيضاء" واحدة',
      'إن كذبت على شخص وأمكن التصحيح، صحّح ما قلت',
    ],
    expiation:
        'رد الحقوق إن وُجدت، وكثرة الاستغفار، وصلة الأرحام. قال ﷺ: "عليكم بالصدق فإن الصدق يهدي إلى البر وإن البر يهدي إلى الجنة" (رواه مسلم).',
    encouragement: 'وَالَّذِينَ لَا يَشْهَدُونَ الزُّورَ (الفرقان 72)',
    tags: ['اللسان', 'أخلاق'],
  ),
  SinItem(
    id: 'delaying_prayer',
    title: 'تأخير الصلاة عن وقتها',
    icon: Icons.schedule,
    color: Color(0xFFB44545),
    rightsHint: 'الصلاة عهد بين ال��بد وربه — حقّ الله.',
    tawbahSteps: [
      'قضاء ما فات من الصلوات على الفور',
      'الندم على التفريط في حق الله',
      'العزم الصادق على عدم التأخير مرة أخرى',
      'الاستعانة بالله: "وأعنّي على ذكر الله وشكره وحسن عبادته"',
    ],
    expiation:
        'قضاء الفوائت فوراً، والإكثار من النوافل، والاستغفار. قال ﷺ: "من نسي صلاة فليصلّها إذا ذكرها لا كفارة لها إلا ذلك" (رواه البخاري ومسلم).',
    encouragement: 'فَوَيْلٌ لِّلْمُصَلِّينَ الَّذِينَ هُمْ عَن صَلَاتِهِمْ سَاهُونَ (الماعون 4-5)',
    tags: ['الصلاة', 'حق الله'],
  ),
  SinItem(
    id: 'backbiting',
    title: 'الغيبة والنميمة',
    icon: Icons.chat_bubble,
    color: Color(0xFFB44545),
    rightsHint: 'حق آدمي — لا تبرأ إلا بالتحلل أو الاستغفار له إن لم يعلم.',
    tawbahSteps: [
      'الإقلاع الفوري عن الغيبة والنميمة',
      'الندم على ما مضى',
      'الاستغفار للمَغتاب — اللهم اغفر له',
      'لا تعِد لسماع الغيبة ولا نقلها؛ اعترض بالحسنى',
      'إن علم المَغتاب ولم يضرّه ذكرُك: استغفر له وتحدث عنه بالخير في نفس المجالس',
    ],
    expiation:
        'قال ﷺ لمن اغتاب: "كفّارتك أن تستغفر له" (قيل: فأستغفر له؟ قال: نعم). وإن كنت ستضره بإخباره فالتحلل يشمل ذكر محاسنه في المجالس نفسها دون إخباره (فتوى النووي وابن حزم).',
    encouragement: 'وَلَا يَغْتَب بَّعْضُكُم بَعْضًا (الحجرات 12)',
    tags: ['اللسان', 'حق الآدمي'],
  ),
  SinItem(
    id: 'looking_at_haram',
    title: 'النظر المحرم',
    icon: Icons.visibility_off,
    color: Color(0xFFB44545),
    rightsHint: 'حق الله — لا حقوق آدميين إلا إن تسبّب في أذى.',
    tawbahSteps: [
      'غض البصر فوراً عن كل ما حرم الله',
      'الاستغفار والإكثار من النوافل',
      'تقليل الفراغ وأسباب الفتنة (متابعات، محتوى، خلوات)',
      'الاستعاذة: "اللهم اصرف قلبي عن معصيتك"',
    ],
    expiation:
        'غضّ البصر، وصلاة ركعتين بنية التوبة، وإطعام مسكين أو إكرام والدين — إحياء القلب بالطاعة يخمد نار المعصية.',
    encouragement: 'قُل لِّلْمُؤْمِنِينَ يَغُضُّوا مِنْ أَبْصَارِهِمْ (النور 30)',
    tags: ['الجوارح', 'القلب'],
  ),
  SinItem(
    id: 'theft',
    title: 'السرقة',
    icon: Icons.back_hand,
    color: Color(0xFFB44545),
    rightsHint: 'حق آدمي محض — لا تسقط بالتوبة وحدها حتى تُردّ.',
    tawbahSteps: [
      'الإقلاع عن السرقة فوراً والندم',
      'العزم على ألا تعود',
      'ردّ المسروق لمالكه أو تصريحًا واضحًا',
      'الاستغفار والإكثار من الكسب الحلال',
    ],
    expiation:
        'رد المسروق كاملاً (أو بدله) لمالكه. إن خفت ضرراً من التصريح فاجعل الرد دون إيذاء النفس بلا كشف عيبه. "من كانت لأخيه عنده مظلمة فليتحلله اليوم قبل أن لا يكون دينار ولا درهم" (رواه البخاري).',
    encouragement: 'فَمَن تَابَ مِن بَعْدِ ظُلْمِهِ وَأَصْلَحَ فَإِنَّ اللَّهَ يَتُوبُ عَلَيْهِ (المائدة 39)',
    tags: ['حق الآدمي', 'المال'],
  ),
  SinItem(
    id: 'usury',
    title: 'الربا',
    icon: Icons.attach_money,
    color: Color(0xFFB44545),
    rightsHint: 'حق آدمي + محاربة لله ورسوله — أعظم التحذير.',
    tawbahSteps: [
      'الإقلاع عن كل تعامل ربوي فوراً',
      'التخلص من الربا المكتسب: لا يبقى منه شيء',
      'التوبة الصادقة والندم',
      'البحث عن بدائل حلال (مرابحة، مشاركة)',
    ],
    expiation:
        'من تاب وعمل صالحاً فله ما كسب يقوله الله تعالى: "وَأَحَلَّ اللَّهُ الْبَيْعَ وَحَرَّمَ الرِّبَا … فَلَهُ مَا سَلَفَ وَأَمْرُهُ إِلَى اللَّهِ" (البقرة 275). يُتخلى عن الربا الجديد ويبقى أصل المال الحلال.',
    encouragement: 'يَمْحَقُ اللَّهُ الرِّبَا وَيُرْبِي الصَّدَقَاتِ (البقرة 276)',
    tags: ['المال', 'حق الآدمي'],
  ),
  SinItem(
    id: 'pride_arrogance',
    title: 'الكِبر والاستعلاء',
    icon: Icons.emoji_events,
    color: Color(0xFFB44545),
    rightsHint: 'خطر عظيم — "لا يدخل الجنة من كان في قلبه مثقال ذرة من كِبر" (رواه مسلم).',
    tawbahSteps: [
      'الإقرار بأن الكِبر مرض قلب خفي',
      'مجالسة الفقراء وخدمة الناس',
      'تذكّر أصل الخلق: من تراب',
      'خِصال المؤمنين الحقيقيين: الحلم والتواضع',
    ],
    expiation:
        'التواضع لله، وحب للمساكين، وخدمتهم بنفسك. "ومن تواضع لله رفعه" (رواه مسلم).',
    encouragement: 'وَعِبَادُ الرَّحْمَٰنِ الَّذِينَ يَمْشُونَ عَلَى الْأَرْضِ هَوْنًا (الفرقان 63)',
    tags: ['القلب'],
  ),
];
