import 'package:apnoxia/Components/apnoxiabutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 100.h),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage(
          //     'assets/WhatsApp Image 2025-03-31 at 01.44.04_8640cb1a.jpg'
          //   ),
          //   fit: BoxFit.cover
          // )
          // gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [
          //     Color(0xff272d4e),
          //     Color(0xff294487),
          //     Color(0xfffffcf5),

          //   ]
          // )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 100.h),
                child: Lottie.asset(
                  'assets/Animation - 1742951422892.json',
                  fit: BoxFit.fill,
                  height: 80.h,
                  repeat: true,
                  animate: true
                ),
              ),
            ),
            Text(
              'Welcome to,\nApnoxia',
              style: GoogleFonts.workSans(
                fontSize: 30.sp,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              'Monitor your sleep, detect apnea early, and improve your well-being.',
              style: GoogleFonts.workSans(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800.withOpacity(0.8),
                letterSpacing: 1
              ),
            ),

            SizedBox(height: 60.h),

            ApnoxiaButton(
              functionality: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              title: 'Get Started', 
              titleSize: 15.sp,
              height: 65.h,
              buttonRadius: 20.r,
              width: double.infinity,
              textColor: Colors.white,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF1E1F25),
                  Color(0xFF1E1F25),
                  Color(0xFF4C5DF4),
                  Color(0xFF6274F2),
                  Color(0xFFDCE1F9),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}