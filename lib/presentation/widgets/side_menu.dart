import 'package:flutter/material.dart';

import '../../config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final hasNoch = MediaQuery.of(context).padding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (index) {
        setState(() {
          navDrawerIndex = index;
        });
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNoch ? 0 : 20, 16, 10),
          child: const Text('Menu principal'),
        ),
        ...appMenuItems.sublist(0, 3).map((e) => NavigationDrawerDestination(
              icon: Icon(e.icon),
              label: Text(e.title),
            )),
        const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10), child: Divider()),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('Mas opciones'),
        ),
        ...appMenuItems.sublist(3).map((e) => NavigationDrawerDestination(
              icon: Icon(e.icon),
              label: Text(e.title),
            )),
      ],
    );
  }
}
