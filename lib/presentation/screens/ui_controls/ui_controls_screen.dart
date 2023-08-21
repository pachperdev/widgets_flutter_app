import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ui Controls'),
        ),
        body: const _UiControlsView());
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Trasportation { car, bike, horse, boat }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Trasportation selectedTransportation = Trasportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Activar modo desarrollador'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = value;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Transportation'),
          subtitle: const Text('Selecciona un vehiculo'),
          initiallyExpanded: true,
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Vehiculo de 4 ruedas'),
              value: Trasportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Trasportation.car;
                });
              },
            ),
            RadioListTile(
              title: const Text('Bike'),
              subtitle: const Text('Vehiculo de 2 ruedas'),
              value: Trasportation.bike,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Trasportation.bike;
                });
              },
            ),
            RadioListTile(
              title: const Text('Horse'),
              subtitle: const Text('Vehiculo de 4 patas'),
              value: Trasportation.horse,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Trasportation.horse;
                });
              },
            ),
            RadioListTile(
              title: const Text('Boat'),
              subtitle: const Text('Vehiculo de 0 ruedas'),
              value: Trasportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Trasportation.boat;
                });
              },
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('¿Desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
