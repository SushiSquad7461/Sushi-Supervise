import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sushi_supervise/ScoutingLib/logic/size/ScreenSize.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_supervise/src/logic/enums/Pages.dart';

class Login extends StatefulWidget {
  final Function(NavPages newPage) changePage;
  const Login({Key? key, required this.changePage}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int? teamNum;
  String? eventCode;
  String? password;

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context);

    return SizedBox(
      width: ScreenSize.width,
      height: ScreenSize.height * 0.9,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(
              top: ScreenSize.height * 0.09, bottom: ScreenSize.height * 0.05),
          child: SizedBox(
            width: ScreenSize.width,
            height: ScreenSize.height * 0.47,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: ScreenSize.width * 0.75,
                    height: ScreenSize.height * 0.07,
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: ScreenSize.height * 0.006,
                              color: colors.primaryColorDark),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: ScreenSize.height * 0.006,
                              color: colors.primaryColorDark),
                        ),
                        hintText: "TEAM #",
                        hintStyle: TextStyle(color: colors.primaryColorDark),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: ScreenSize.height * 0.005),
                      ),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mohave(
                          textStyle: TextStyle(
                        fontSize: ScreenSize.width * 0.07,
                        color: colors.primaryColorDark,
                      )),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (String? val) => setState(() {
                        teamNum = (val != null ? int.parse(val) : val) as int?;
                      }),
                    ),
                  ),
                  SizedBox(
                    width: ScreenSize.width * 0.75,
                    height: ScreenSize.height * 0.07,
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: ScreenSize.height * 0.006,
                              color: colors.primaryColorDark),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: ScreenSize.height * 0.006,
                              color: colors.primaryColorDark),
                        ),
                        hintText: "EVENT CODE",
                        hintStyle: TextStyle(color: colors.primaryColorDark),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: ScreenSize.height * 0.005),
                      ),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mohave(
                          textStyle: TextStyle(
                        fontSize: ScreenSize.width * 0.07,
                        color: colors.primaryColorDark,
                      )),
                      keyboardType: TextInputType.text,
                      onChanged: (String? val) => setState(() {
                        eventCode = val;
                      }),
                    ),
                  ),
                  SizedBox(
                    width: ScreenSize.width * 0.75,
                    height: ScreenSize.height * 0.07,
                    child: TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: ScreenSize.height * 0.006,
                              color: colors.primaryColorDark),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: ScreenSize.height * 0.006,
                              color: colors.primaryColorDark),
                        ),
                        hintText: "PASSWORD",
                        hintStyle: TextStyle(color: colors.primaryColorDark),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: ScreenSize.height * 0.005),
                      ),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mohave(
                          textStyle: TextStyle(
                        fontSize: ScreenSize.width * 0.07,
                        color: colors.primaryColorDark,
                      )),
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (String? val) => setState(() {
                        password = val;
                      }),
                    ),
                  ),
                ]),
          ),
        ),
        SizedBox(
          width: ScreenSize.width,
          height: ScreenSize.height * 0.29,
          child: Stack(
            children: [
              SvgPicture.asset(
                "./assets/images/banner.svg",
                width: ScreenSize.width,
              ),
              if (teamNum != null && eventCode != null && password != null)
                Padding(
                  padding: EdgeInsets.only(top: ScreenSize.height * 0.185),
                  child: Container(
                      width: ScreenSize.width,
                      decoration: BoxDecoration(
                        color: colors.primaryColorDark,
                      ),
                      child: TextButton(
                        onPressed: () => {
                          widget.changePage(NavPages.Upload)
                        },
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
