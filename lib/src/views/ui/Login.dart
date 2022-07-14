import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sushi_supervise/ScoutingLib/logic/size/ScreenSize.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context);

    return SizedBox(
      width: ScreenSize.width,
      height: ScreenSize.height * 0.9,
      child: Column(children: [
        SizedBox(
          width: ScreenSize.width,
          height: ScreenSize.height * 0.6,
        ),
        SizedBox(
          width: ScreenSize.width,
          height: ScreenSize.height * 0.3,
          child: Stack(
            children: [
              SvgPicture.asset(
                "./assets/images/banner.svg",
                width: ScreenSize.width,
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenSize.height * 0.185),
                child: Container(
                    width: ScreenSize.width,
                    decoration: BoxDecoration(
                      color: colors.primaryColorDark,
                    ),
                    child: TextButton(
                      onPressed: () => {print("YO")},
                      child: Text(
                        'GO',
                        style: TextStyle(
                            fontSize: 35 * ScreenSize.swu,
                            fontFamily: "Sushi",
                            color: colors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
