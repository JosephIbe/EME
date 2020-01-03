import 'package:flutter/material.dart';
import 'package:my_eme/dialogs/location_dialog.dart';
import 'package:my_eme/screens/can_return.dart';
import 'package:my_eme/screens/home.dart';
import 'package:my_eme/screens/login.dart';
import 'package:my_eme/screens/my_card.dart';
import 'package:my_eme/screens/orders/occasional_history.dart';
import 'package:my_eme/screens/orders/regular_history.dart';
import 'package:my_eme/screens/service_coming.dart';
import 'package:my_eme/screens/validate_otp.dart';

import 'constants.dart';

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case loginRoute:
        return MaterialPageRoute(builder:  (_) => Login());
        break;
      case otpRoute:
        return MaterialPageRoute(builder:  (_) => ValidateOTP());
      case locationDialogRoute:
        return MaterialPageRoute(builder: (_) => LocationDialog());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
        break;
      case regularOHRoute:
        var arguments = settings.arguments;
        return MaterialPageRoute(builder: (_) => RegularOrderHistory(args: arguments,));
        break;
      case occasionalOHRoute:
        var arguments = settings.arguments;
        return MaterialPageRoute(builder: (_) => OccasionalOrderHistory(args: arguments,));
        break;
      case myCardRoute:
        var arguments = settings.arguments;
        return MaterialPageRoute(builder: (_) => MyCard(args: arguments));
        break;
      case canReturnRoute:
        return MaterialPageRoute(builder: (_)=> CanReturn());
        break;
      case serviceComingRoute:
        var arguments = settings.arguments;
        return MaterialPageRoute(builder: (_) => ServiceComingSoon(args: arguments,));
        break;
      case serviceComingRoute:
        var arguments = settings.arguments;
        return MaterialPageRoute(builder: (_) => ServiceComingSoon(args: arguments,));
        break;
      case serviceComingRoute:
        var arguments = settings.arguments;
        return MaterialPageRoute(builder: (_) => ServiceComingSoon(args: arguments,));
        break;
//      case shareAppRoute:
//        return MaterialPageRoute(builder: (_) => );
//        break;
//      case contactUsRoute:
//        return MaterialPageRoute(builder: (_) => );
//        break;
      case logOutRoute:
        return MaterialPageRoute(builder: (_) => Login());
        break;
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text('No route specified for ${settings.name}'),
          ),
        ));
    }
  }

}