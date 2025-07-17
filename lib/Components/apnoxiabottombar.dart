import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApnoxiaBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const ApnoxiaBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900.withOpacity(0.15),
            blurRadius: 15,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          navBarItem(Icons.monitor_heart_rounded, 0),
          navBarItem(Icons.info_outline_rounded, 1),
        ],
      ),
    );
  }

  Widget navBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.bounceInOut,
        child: Icon(
          icon,
          color: selectedIndex == index? Colors.white : Colors.grey.shade800.withOpacity(0.9),
          size: selectedIndex == index ? 40.r : 30.r, 
        ),
      ),
    );
  }
}
