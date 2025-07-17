import 'package:apnoxia/Components/apnoxiabutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Messagedialog extends StatelessWidget {
  final String message;
  final Color messageFontColor;

  const Messagedialog({
    super.key,
    required this.message,
    required this.messageFontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: IntrinsicWidth( 
        child: IntrinsicHeight( 
          child: Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.9),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,  
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  message,
                  style: GoogleFonts.workSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: messageFontColor,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 25),

                ApnoxiaButton(
                  functionality: () {
                    Navigator.pop(context);
                  },
                  title: 'Exit',
                  titleSize: 18,
                  height: 50,
                  buttonRadius: 15,
                  width: double.infinity,
                  textColor: Colors.white,
                  buttonColor: Colors.grey.shade800.withOpacity(0.7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
