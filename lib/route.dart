import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jjcar/page/page_home.dart';
import 'package:jjcar/page/page_result.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    dynamic arguments = settings.arguments;

    switch (settings.name) {
      case 'PageHome':
        return CupertinoPageRoute(
          builder: (_) => PageHome(),
          settings: settings,
        );

      case 'PageResult':
        return CupertinoPageRoute(
          builder: (_) => PageResult(
            results: arguments,
          ),
          settings: settings,
        );

      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
<<<<<<< HEAD
              child:
                  Text('${settings.name} 는 lib/route.dart에 정의 되지 않았습니다!123.'),
=======
              child: Text('${settings.name} 는 lib/route.dart에 정의 되지 않았습니다!.555'),
>>>>>>> 77245df97f5ffe9014d6218b1654f0292ce9d74f
            ),
          ),
        );
    }
  }

  static loadMain(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('PageTabs', (route) => false);
    // if (Singleton.shared.userData!.user!.agreeTerms == true) {
    //   Navigator.of(context)
    //       .pushNamedAndRemoveUntil('PageTabs', (route) => false);
    // } else {
    //   Navigator.of(context).pushNamedAndRemoveUntil(
    //     'PageAgreement',
    //     (route) => false,
    //     arguments: true,
    //   );
    // }
  }
}
