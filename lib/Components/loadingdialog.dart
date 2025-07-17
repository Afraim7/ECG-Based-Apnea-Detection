import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Loadingdialog extends StatelessWidget {
  final String message;
  const Loadingdialog({super.key, required this.message});

  @override
@override
Widget build(BuildContext context) {
  return Dialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    insetPadding: EdgeInsets.zero, // Prevent Flutter from adding default padding
    child: Center( // Important to center the dialog and apply fixed size
      child: SizedBox(
        width: 200,
        height: 200,
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.9),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/Animation - 1742668574025.json',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 25),
              Text(
                message,
                style: GoogleFonts.workSans(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


}
