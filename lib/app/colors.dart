import 'package:flutter/material.dart';

/// Tawwab brand palette. See workspace/brand/IDENTITY.md for the rationale.
class TawwabColors {
  TawwabColors._();

  static const primary = Color(0xFF14524D);       // teal — brand
  static const primaryDeep = Color(0xFF0E4744);   // gradient / dark base
  static const primaryLight = Color(0xFF1A6F6A);  // hovers / accents
  static const accent = Color(0xFFC9A24B);        // gold — ranking / tasbeeh
  static const accentSoft = Color(0xFFE2C987);    // subtle gold bg
  static const surface = Color(0xFFF7F3EA);       // cream light bg
  static const ink = Color(0xFF102A29);           // primary text (light)
  static const muted = Color(0xFF5B6B68);         // secondary text
  static const error = Color(0xFFB44545);
  static const success = Color(0xFF2E7D5B);

  // Dark mode
  static const darkBase = Color(0xFF0E2625);
  static const darkSurface = Color(0xFF14302E);
  static const darkInk = Color(0xFFE8E2D5);
}
