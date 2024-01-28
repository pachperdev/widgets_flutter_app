import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Theme Changer Screen'),
          actions: [
            IconButton(
              onPressed: () {
                // ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              },
              icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            ),
          ],
        ),
        body: const _ThemeChangerView());
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            // ref.read(selectedColorProvider.notifier).state = value ?? 0;
            ref
                .read(themeNotifierProvider.notifier)
                .changeColorIndex(value ?? 0);
          },
        );
      },
    );
  }
}
