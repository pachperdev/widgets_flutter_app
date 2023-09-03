import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_flutter_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

final colorListProvider = Provider((ref) => colorList);
