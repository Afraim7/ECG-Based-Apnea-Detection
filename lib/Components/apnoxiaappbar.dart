import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ApnoxiaAppBar extends StatelessWidget implements PreferredSizeWidget 
{
  final String title;
  const ApnoxiaAppBar({super.key, required this.title});    

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: GoogleFonts.workSans(
          color: Colors.black,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 2
        ),
      ),
    );
  }
}