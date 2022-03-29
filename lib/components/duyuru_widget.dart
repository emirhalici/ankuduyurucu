import 'package:auduyurucu/models/duyuru_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DuyuruWidget extends StatelessWidget {
  final DuyuruModel duyuru;
  const DuyuruWidget({Key? key, required this.duyuru}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Theme.of(context).brightness == Brightness.dark ? const Color(0xAA393f41) : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 16.0,
            spreadRadius: 0.0,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  duyuru.title.trim(),
                  style: TextStyle(fontSize: 24.sp),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  '${duyuru.day}/${duyuru.month}/${duyuru.year}',
                  style: TextStyle(fontSize: 16.sp),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          Text(
            duyuru.text.trim(),
            style: TextStyle(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
