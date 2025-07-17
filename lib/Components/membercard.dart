import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberCard extends StatelessWidget {
  final String picture;
  final String name;
  final String role;

  const MemberCard({
    super.key, 
    required this.name,
    required this.role, 
    required this.picture,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.r,
      width: 100.r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100.r,
            width: 100.r,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: AssetImage(picture),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            name,
            style: GoogleFonts.workSans(fontSize: 13.sp, fontWeight: FontWeight.w600, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 3.h),
          Text(
            role,
            style: GoogleFonts.workSans(fontSize: 11.sp, fontWeight: FontWeight.w500, color: Colors.blueGrey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}