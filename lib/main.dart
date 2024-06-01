import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class ColorSettings extends ChangeNotifier {
  bool isRed = false;

  void setRed(bool isRed) {
    if (isRed == true) {
      this.isRed = true;
    } else {
      this.isRed = false;
    }
  }

  // void setRed() {
  //   this.isRed = true;
  // }

  // void unSetRed() {
  //   this.isRed = false;
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manejo de estados con: setState',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Metodo setState'),
        ),
        //body: const SettingScreen(),
        body: ChangeNotifierProvider(
          create: (context) => ColorSettings(),
          child: const SettingScreen(),
        ),
      ),
    );
  }
}

// class SettingScreen extends StatefulWidget {
//   const SettingScreen({super.key});

//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }

// class SettingScreen extends StatelessWidget {
//   const SettingScreen({super.key});

//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }

// class _SettingScreenState extends State<SettingScreen> {
//   bool isChecked = false;
//   @override
//   Widget build(BuildContext context) {
//     // print('Evento build');
//     // return Row(
//     //   children: [
//     //     Checkbox(
//     //       value: isChecked,
//     //       onChanged: onChangedCheckBox,
//     //     )
//     //   ],
//     // );

//     return Column(
//       children: [
//         ColorSelection(
//           isChecked: isChecked,
//           onChangedCheckBox: onChangedCheckBox,
//         ),
//         ColoredBox(showColor: isChecked)
//       ],
//     );
//   }

class SettingScreen extends StatelessWidget {
  //bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // print('Evento build');
    // return Row(
    //   children: [
    //     Checkbox(
    //       value: isChecked,
    //       onChanged: onChangedCheckBox,
    //     )
    //   ],
    // );

    return const Column(
      children: [
        ColorSelection(),
        ColoredBox(),
      ],
    );
  }

  // codigo: 29/05/2024
  void onChangedCheckBox(bool? value) {
    setState(() {});
    isChecked = value!;
    // setState(() {
    //   isChecked = value!;
    // });
  }
}

// class ColorSelection extends StatelessWidget {
//   //final bool isChecked = false;
//   final bool isChecked;
//   final ValueChanged<bool?> onChangedCheckBox;

//   const ColorSelection(
//       {super.key, required this.isChecked, required this.onChangedCheckBox});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Checkbox(
//           value: isChecked,
//           onChanged: onChangedCheckBox,
//         ),
//         const Text('Color rojo'),
//       ],
//     );
//   }
// }

class ColorSelection extends StatelessWidget {
  //final bool isChecked = false;
  //final bool isChecked;
  //final ValueChanged<bool?> onChangedCheckBox;

  const ColorSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorSettings>(builder: (context, colorSettings, child) {
      return Row(
        children: [
          Checkbox(
            value: colorSettings.isRed,
            onChanged: onChangedCheckBox,
          ),
          const Text('Color rojo'),
        ],
      );
    });
  }
}

// class ColoredBox extends StatelessWidget {
//   final bool showColor;

//   const ColoredBox({super.key, required this.showColor});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: showColor ? Colors.red : Colors.black38,
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.all(10),
//     );
//   }
// }

class ColoredBox extends StatelessWidget {
  //final bool showColor;

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
