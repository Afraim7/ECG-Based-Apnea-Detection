import 'dart:ui';
import 'package:apnoxia/Components/apnearesulttile.dart';
import 'package:apnoxia/Components/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatelessWidget {
  final List<int> segmentSamples;
  final String apneaResult;

  const Result({
    super.key,
    required this.segmentSamples,
    required this.apneaResult,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.95,
      minChildSize: 0.4,
      builder: (_, controller) {
        return Container(
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.95),
            borderRadius: BorderRadius.circular(35.r),
          ),
          child: ListView(
            controller: controller,
            children: [
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 15.w),
                  Expanded(
                    flex: 2,
                    child: Divider(color: Colors.white, thickness: 1),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Analysis \nResult',
                      style: GoogleFonts.workSans(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Divider(color: Colors.white, thickness: 1),
                  ),
                  SizedBox(width: 15.w),
                ],
              ),
              SizedBox(height: 30.h),
              Chart(segmentSamples: segmentSamples),
              SizedBox(height: 10.h),
              ApneaResultTile(result: apneaResult),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
