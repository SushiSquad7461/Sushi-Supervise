import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:localstore/localstore.dart';
import 'ScoutingLib/logic/data/ConfigFileReader.dart';
import 'ScoutingLib/logic/data/ScoutingData.dart';
import 'ScoutingLib/logic/size/ScreenSize.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Wrapper());
}

class Themes {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    primaryColorDark: Colors.black,
    scaffoldBackgroundColor: Colors.white,
  );

  static ThemeData dark = ThemeData(
    primaryColor: Colors.black,
    primaryColorDark: Colors.white,
    scaffoldBackgroundColor: Colors.black,
  );
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sushi Supervise",
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.system,
      home: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SushiSupervise(),
      ),
    );
  }
}

class SushiSupervise extends StatefulWidget {
  const SushiSupervise({Key? key}) : super(key: key);

  @override
  State<SushiSupervise> createState() => _SushiSuperviseState();
}

class _SushiSuperviseState extends State<SushiSupervise> {
  @override
  Widget build(BuildContext context) {
    return (Center(
      child: Text("Yo"),
    ));
  }
}
