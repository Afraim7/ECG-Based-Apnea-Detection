import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ApnoxiaButton extends StatelessWidget {
  final VoidCallback functionality;
  final String title;
  final double titleSize;
  final double height;
  final double width;
  final double buttonRadius;
  final Color buttonColor;
  final Color textColor;
  final Gradient? gradient;


  const ApnoxiaButton({
    super.key,
    required this.functionality,
    required this.title,
    required this.titleSize,
    required this.height,
    required this.width,
    this.buttonColor = Colors.transparent, 
    required this.buttonRadius,
    required this.textColor,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: functionality,
      borderRadius: BorderRadius.circular(buttonRadius.r),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: gradient == null ? buttonColor : null,
          gradient: gradient,
          borderRadius: BorderRadius.circular(buttonRadius.r),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.workSans(
                color: textColor,
                fontSize: titleSize,
                letterSpacing: 2,
                fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      ),
    );
  }
}
