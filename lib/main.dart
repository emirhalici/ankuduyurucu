import 'package:auduyurucu/providers/main_provider.dart';
import 'package:auduyurucu/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initializationSettingsAndroid = const AndroidInitializationSettings('ankara_logo');
  var initializationSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {},
  );
  var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: ((payload) {
    if (payload != null) {
      print('payload: ' + payload);
    }
  }));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ANKU Duyurucu',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primaryColor: const Color(0xAA758ECD),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xAA758ECD),
              secondary: const Color(0xAA506fbf),
            ),
        brightness: Brightness.light,
        fontFamily: 'Poppins',
      ),
      darkTheme: ThemeData(
        primaryColor: const Color(0xAAF06543),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xAAF06543),
              onPrimary: Colors.white,
              secondary: const Color(0xAAF09D51),
              onSecondary: Colors.black,
              brightness: Brightness.dark,
              background: const Color(0xAA313638),
            ),
        scaffoldBackgroundColor: const Color(0xAA313638),
        fontFamily: 'Poppins',
      ),
      home: ScreenUtilInit(designSize: const Size(428, 926), builder: () => const HomeScreen()),
    );
  }
}
