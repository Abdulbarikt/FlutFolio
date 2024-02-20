import 'package:flutter/material.dart';
import 'package:portfolio_/app/utils/colores.dart';
import 'package:portfolio_/app/widgets/main_mobile.dart';
// import 'dart:js'as js;
import '../utils/size.dart';
import '../widgets/condact_section.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/footer.dart';
import '../widgets/header_desktop.dart';
import '../widgets/header_mobile.dart';
import '../widgets/main_desktop.dart';
import '../widgets/project_section.dart';
import '../widgets/skill_desktop.dart';
import '../widgets/skill_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scafoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarkeys = List.generate(4, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    // ignore: non_constant_identifier_names
    return LayoutBuilder(builder: (context, Constraints) {
      return Scaffold(
        key: scafoldKey,
        backgroundColor: CustomColor.scafoldBG,
        endDrawer: Constraints.maxWidth >= kMinDesktopWidth
            ? null
            : DraweMobile(
                onNavItemTap: (int navIndex) {
                  scafoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                },
              ),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(key: navbarkeys.first),
              //AppBar
              if (Constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop(
                  onNavMenuTap: (int navIndex) {
                    scrollToSection(navIndex);
                  },
                )
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scafoldKey.currentState?.openEndDrawer();
                  },
                ),

              //Main Part
              if (Constraints.maxWidth >= kMinDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),

              // skills
              Container(
                key: navbarkeys[1],
                width: screenWidth,
                color: CustomColor.bgLight1,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'What Can I Do',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    if (Constraints.maxWidth >= kMedDesktopWidth)
                      const SkillDesktop()
                    else
                      const SkillMobile(),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // //projects
              ProjectSection(
                key: navbarkeys[2],
              ),
              // //condact
              CondactSection(
                key: navbarkeys[3],
              ),
              // //footer
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      // js.context.callMethod('open')
      return;
    }
    final key = navbarkeys[navIndex];
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }
}
