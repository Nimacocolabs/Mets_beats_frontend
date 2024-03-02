import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mets_beats_app/Notifications/oneSignalNotification.dart';
import 'package:mets_beats_app/elements/apperror_widget.dart';
import 'package:mets_beats_app/presentation/welcome_screen/splash_screen.dart';


void main() async {
  bool isDev = false;
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return AppErrorWidget(
      errorDetails: errorDetails,
      isDev: isDev,
    );
  };

  WidgetsFlutterBinding.ensureInitialized();
  OneSignalNotifications().initializeOnesignal();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MetsBeatsApp());
  });
}


class MetsBeatsApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'Montserrat'),
       home:SplashScreen(),
    );
  }
}

