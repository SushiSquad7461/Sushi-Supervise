import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:localstore/localstore.dart';
import 'package:sushi_supervise/src/logic/enums/Pages.dart';
import 'package:sushi_supervise/src/views/ui/Login.dart';
import 'package:sushi_supervise/src/views/util/Header/HeaderNav.dart';
import 'package:sushi_supervise/src/views/util/Header/HeaderTitle.dart';
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
  Pages currPage = Pages.Upload;

  void setPage(NavPages nextPage) {
    for (var value in Pages.values) {
      if (value.toString().split(".")[1] == nextPage.toString().split(".")[1]) {
        setState(() {
          currPage = value;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.width = MediaQuery.of(context).size.width;
    ScreenSize.height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: ScreenSize.height,
      width: ScreenSize.width,
      child: Column(
        children: [
          const HeaderTitle(),
          if (isPageInNav(currPage)) HeaderNav(changePage: setPage, currPage: currPage,),
          SizedBox(
            width: ScreenSize.width,
            height: ScreenSize.height * (isPageInNav(currPage) ? 0.61 : 0.9),
            child: Navigator(
              pages: [
                if (currPage == Pages.Login) MaterialPage(child: Login(changePage: setPage))
                else if (currPage == Pages.Upload) MaterialPage(child: Text("yo"))
                else MaterialPage(child: Text("asd"))
              ],
              onPopPage: (route, result) {
                return route.didPop(result);
              },
            ),
          ),
          if (isPageInNav(currPage)) 
            SizedBox(
              height: ScreenSize.height * 0.19,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "./assets/images/footer.png",
                    scale: ScreenSize.width * 0.001,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
