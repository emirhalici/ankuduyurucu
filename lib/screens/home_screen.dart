import 'package:auduyurucu/components/duyuru_widget.dart';
import 'package:auduyurucu/models/duyuru_model.dart';
import 'package:auduyurucu/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

showNotifications(String title, String body) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('id01', 'duyuruChannel', importance: Importance.max, priority: Priority.high, ticker: 'ticker');
  const IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);
  await flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifics, payload: 'item x');
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MainProvider>().duyurular = [];
    context.read<MainProvider>().getDuyuru();
  }

  @override
  Widget build(BuildContext context) {
    List<DuyuruModel> duyurular = context.watch<MainProvider>().duyurular;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ANKU Duyurucu'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: duyurular.map((duyuru) => DuyuruWidget(duyuru: duyuru)).toList(),
        ),
      ),
    );
  }
}
