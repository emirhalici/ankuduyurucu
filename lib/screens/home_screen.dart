import 'package:auduyurucu/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<MainProvider>().getDuyuru();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ANKU Duyurucu'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Text',
              style: TextStyle(
                fontSize: 34.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
