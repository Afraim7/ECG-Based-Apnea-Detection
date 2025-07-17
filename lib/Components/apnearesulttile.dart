import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ApneaResultTile extends StatelessWidget {
  final String result;
  const ApneaResultTile({super.key, required this.result});

   String getApneaMessage() {
    if (result.toLowerCase().contains('apnea')) {
      return 'Apnea detected.';
    } 
    if (result.toLowerCase().contains('normal')) {
      return 'Normal result.';
    }
      
    return 'No data available.';
  }

  Color getTileColor() {
    if (result.isEmpty) {
      return const Color(0xffd9d9d9);
    }
    if (result.toLowerCase() == 'apnea') {
      return Colors.red.shade900.withOpacity(0.7);
    } 
    if (result.toLowerCase() == 'normal') {
      return Colors.green.shade700.withOpacity(0.7);
    }
    return const Color(0xffd9d9d9);
  }

  String getTileIcon() {
    if (result.isEmpty) {
      return 'assets/Animation - 1743286894032.json';
    }
    if (result.toLowerCase() == 'apnea') {
      return 'assets/Animation - 1743286894032.json';
    } 
    if (result.toLowerCase() == 'normal') {
      return 'assets/Animation - 1743286723248.json';
    }
      return 'assets/Animation - 1743286894032.json';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: getTileColor(),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.1)
            ),
            child: Lottie.asset(
              getTileIcon(),
              fit: BoxFit.fill,
              repeat: true,
              animate: true
            ),
          ),

          SizedBox(width: 10.w),
      
          Text(
            getApneaMessage(),
            style: GoogleFonts.workSans(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),
          ),
        ],
      ),
    );
  }
}
