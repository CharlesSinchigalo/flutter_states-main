import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class ColorSettings extends ChangeNotifier {
  bool isRed = false;
  String text = 'Texto de color negro';

  void setRed(bool isRed) {
    if (isRed == true) {
      this.isRed = true;
      this.text = 'Texto de color rojo';
    } else {
      this.isRed = false;
      this.text = 'Texto de color negro';
    }

    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manejo de estados con Provider',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Metodo Provider'),
        ),
        body: ChangeNotifierProvider(
          create: (context) => ColorSettings(),
          child: const SettingScreen(),
        ),
      ),
    );
  }
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ColorSelection(),
        const ColoredBox(),
        Consumer<ColorSettings>(
          builder: (context, colorSettings, child) {
            return Text(
              'Texto de color rojo',
              style: TextStyle(
                color: colorSettings.isRed ? Colors.red : Colors.black,
              ),
            );
          },
        ),
      ],
    );
  }
}

class ColorSelection extends StatelessWidget {
  const ColorSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorSettings>(builder: (context, colorSettings, child) {
      return Row(
        children: [
          Checkbox(
            value: colorSettings.isRed,
            onChanged: (isChecked) {
              onChangedCheckBox(isChecked, context);
            },
          ),
          const Text('Color rojo'),
        ],
      );
    });
  }

  void onChangedCheckBox(bool? value, BuildContext context) {
    var colorSettings = Provider.of<ColorSettings>(context, listen: false);
    colorSettings.setRed(value!);
  }
}

class ColoredBox extends StatelessWidget {
  const ColoredBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorSettings>(
      builder: (context, colorSettings, child) {
        return Container(
          color: colorSettings.isRed ? Colors.red : Colors.black38,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
        );
      },
    );
  }
}
