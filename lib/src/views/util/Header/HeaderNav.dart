import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_supervise/src/logic/enums/Pages.dart';

import '../../../../ScoutingLib/logic/color/HexColor.dart';
import '../../../../ScoutingLib/logic/size/ScreenSize.dart';

class HeaderNav extends StatelessWidget {
  final Function(NavPages newPage) changePage;
  final Pages currPage;
  const HeaderNav({Key? key, required this.changePage, required this.currPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context);
    final TextStyle pageStyle = TextStyle(
      fontSize: 29 * ScreenSize.swu,
      fontWeight: FontWeight.w700,
      color: colors.primaryColorDark,
    );

    return Container(
        height: ScreenSize.height * 0.1,
        child: Padding(
          padding: EdgeInsets.only(
              left: 0, right: 0, top: 7 * ScreenSize.shu, bottom: 0),
          child: Column(
            children: [
              Divider(
                color: colors.primaryColorDark,
                thickness: 4 * ScreenSize.shu,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                for (var page in NavPages.values)
                  Padding(
                      padding: EdgeInsets.only(
                          left: 0,
                          right: 0,
                          top: 0 * ScreenSize.shu,
                          bottom: 0 * ScreenSize.shu),
                      child: GestureDetector(
                          onTap: () => changePage(page),
                          child: Container(
                              decoration: ((currPage.toString().split(".")[1] == page.toString().split(".")[1])
                                  ? BoxDecoration(
                                      border: Border.all(
                                          color: HexColor("#FF729F"),
                                          width: 5 * ScreenSize.shu),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5 * ScreenSize.swu)),
                                    )
                                  : BoxDecoration(
                                      border: Border.all(
                                          color: colors.scaffoldBackgroundColor,
                                          width: 5 * ScreenSize.swu))),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 4 * ScreenSize.swu,
                                      right: 4 * ScreenSize.swu,
                                      top: 2 * ScreenSize.swu,
                                      bottom: 2 * ScreenSize.swu),
                                  child: Text(
                                    page.toString().split(".")[1].toUpperCase(),
                                    style: GoogleFonts.mohave(
                                        textStyle: pageStyle),
                                  )))))
              ]),
              Divider(
                color: colors.primaryColorDark,
                thickness: 4 * ScreenSize.shu,
              ),
            ],
          ),
        ));
  }
}
