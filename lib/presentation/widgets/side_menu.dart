import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final bool hasNoch = MediaQuery.of(context).padding.top > 35;

    return SafeArea(
      child: Material(
        shape: Border.all(
            style: BorderStyle.none), // Esto eliminará los bordes redondeados
        child: NavigationDrawer(
          selectedIndex: navDrawerIndex,
          onDestinationSelected: (index) {
            setState(() {
              navDrawerIndex = index;
            });

            final MenuItem menuItem = appMenuItems[index];
            context.push(menuItem.link);
            widget.scaffoldKey.currentState?.closeDrawer();
          },
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(28, hasNoch ? 0 : 20, 16, 10),
              child: const Text('Menu principal'),
            ),
            ...appMenuItems
                .sublist(0, 3)
                .map((e) => NavigationDrawerDestination(
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
        ),
      ),
    );
  }
}
