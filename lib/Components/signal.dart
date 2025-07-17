import 'package:apnoxia/Components/apnoxiabutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Signal extends StatelessWidget {
  final String title;
  final String size;
  final int samples;
  final int segments;
  final Function(int) onSegmentSelected;
  final Function() onDetectPressed;

  const Signal({
    super.key,
    required this.title,
    required this.size,
    required this.samples,
    required this.segments,
    required this.onSegmentSelected,
    required this.onDetectPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.r),
        gradient: LinearGradient(
          colors: [
            Color(0xFF6366F1), Color(0xFF4338CA),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffF1F5FF),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Icon(
                    Icons.file_present_rounded,
                    size: 40.w,
                    color: Color(0xff3B82F6),
                  ),
                  SizedBox(height: 7.h),
                  Text(
                    title,
                    style: GoogleFonts.workSans(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1E293B),
                      letterSpacing: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.r),
                    child: Text(
                      "You've selected an ECG file $size. Check its details below and pick a segment index for apnea detection.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.workSans(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1E293B),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      
            Padding(
              padding: EdgeInsets.only(left: 15.r, right: 0), 
              child: Column(
                children: [
                  Divider(color: Colors.white, thickness: 1, endIndent: 0),
                  SizedBox(height: 10.h),
      
                  _buildInfoRow("File Size", size),
                  SizedBox(height: 10.h),
                  Divider(color: Colors.white, thickness: 1, endIndent: 0),
      
                  SizedBox(height: 10.h),
                  _buildInfoRow("Samples", "$samples"),
                  SizedBox(height: 10.h),
                  Divider(color: Colors.white, thickness: 1, endIndent: 0),
      
                  SizedBox(height: 10.h),
                  _buildInfoRow("Segments", "$segments"),
                  SizedBox(height: 10.h),
                  Divider(color: Colors.white, thickness: 1, endIndent: 0),
      
                  SizedBox(height: 10.h),
                  SelectSegmentID(
                    segments: segments,
                    initialValue: segments, 
                    onSegmentSelected: onSegmentSelected,
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
      
            Padding(
              padding: EdgeInsets.all(15.r),
              child: ApnoxiaButton(
                functionality: () => onDetectPressed(),
                height: 50.h,
                width: double.infinity,
                buttonRadius: 15.r,
                title: 'Analyze',
                titleSize: 15.sp,
                textColor: Colors.white,
                buttonColor: Color(0xff4F46E5).withOpacity(0.3),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.workSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff1F1F1F),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.workSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff64748B),
            ),
          ),
        ],
      ),
    );
  }
}
class SelectSegmentID extends StatefulWidget {
  final int segments;
  final Function(int) onSegmentSelected;
  final int initialValue;

  const SelectSegmentID({
    super.key,
    required this.segments,
    required this.onSegmentSelected,
    this.initialValue = 1,
  });

  @override
  State<SelectSegmentID> createState() => _SelectSegmentIDState();
}

class _SelectSegmentIDState extends State<SelectSegmentID> {
  late int _selectedSegment;

  @override
  void initState() {
    super.initState();
    _selectedSegment = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Select a\nsegment ID",
            style: GoogleFonts.workSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff1E293B),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF6366F1),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: _selectedSegment,
                icon: Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 25,
                ),
                style: GoogleFonts.workSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff64748B),
                ),
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                menuMaxHeight: 300.h,
                items: List.generate(widget.segments, (index) => index + 1)
                    .map((segment) => DropdownMenuItem<int>(
                          value: segment,
                          child: Text(segment.toString()),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedSegment = value;
                    });
                    widget.onSegmentSelected(value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}