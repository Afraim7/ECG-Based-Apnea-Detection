import 'package:apnoxia/Components/apnoxiaappbar.dart';
import 'package:apnoxia/Components/membercard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AboutApnoxia extends StatelessWidget {
  const AboutApnoxia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ApnoxiaAppBar(title: 'Apnoxia'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Lottie.asset(
                'assets/Animation - 1742951422892.json',
                fit: BoxFit.fill,
                height: 80.h,
                repeat: true,
                animate: true
              ),
            ),


            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Text(
                'Empowering the Medical World',
                style: GoogleFonts.workSans(fontSize: 25.sp, fontWeight: FontWeight.bold, color:Colors.black, letterSpacing: 1),
                textAlign: TextAlign.center,
              ),
            ),

            Text(
              'At Apnoxia, we harness the power of AI-driven diagnostics to revolutionize sleep apnea detection. Our mission is to bridge the gap between medical expertise and cutting-edge technology, enabling doctors and researchers to make accurate, data-driven decisions with confidence.',
              style: GoogleFonts.workSans(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xff64748B), letterSpacing: 1),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 80.h),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Our Mission',
                style: GoogleFonts.workSans(fontSize: 22.sp, fontWeight: FontWeight.bold, color:Color(0xff1F1F1F), letterSpacing: 1),
              ),
            ),

            SizedBox(height: 15.h),


            // the first vision section
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      image: const DecorationImage(
                        image: AssetImage('assets/1650819848158.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ) ,
                  ),
                ),

                SizedBox(width: 7.w),

                Expanded(
                  flex: 2,
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r)
                    ) ,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '01',
                          style: GoogleFonts.workSans(fontSize: 20.sp, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 218, 48, 35), letterSpacing: 1),
                        ),
                        Text(
                          'Bridging AI & Medicine',
                          style: GoogleFonts.workSans(fontSize: 15.sp, fontWeight: FontWeight.w600, color:Color(0xff1F1F1F), letterSpacing: 1),
                        ),
                        Text(
                          'Deep learning solutions empowering life-saving decisions',
                          style: GoogleFonts.workSans(fontSize: 13.sp, fontWeight: FontWeight.w500, color: Color(0xff64748B), letterSpacing: 1),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 25.h),


            // the second vision section
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r)
                    ) ,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '02',
                          style: GoogleFonts.workSans(fontSize: 20.sp, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 218, 48, 35), letterSpacing: 1),
                        ),
                        Text(
                          'Advancing Sleep Health',
                          style: GoogleFonts.workSans(fontSize: 15.sp, fontWeight: FontWeight.w600, color:Color(0xff1F1F1F), letterSpacing: 1),
                        ),
                        Text(
                          'AI-powered analysis for faster sleep apnea detection',
                          style: GoogleFonts.workSans(fontSize: 13.sp, fontWeight: FontWeight.w500, color: Color(0xff64748B), letterSpacing: 1),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 7.w),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r)
                    ) ,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),
                      child: Lottie.asset(
                        'assets/Animation - 1742951504559.json',
                        fit: BoxFit.fill,
                        repeat: true,
                        animate: true
                      ),
                    ),
                  ),
                )
              ],
            ),



            SizedBox(height: 25.h),


            // Third vision section
            Column(
              children: [
                Container(
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    image: DecorationImage(
                      image: AssetImage('assets/background_no-graphics.webp'),
                      fit: BoxFit.cover,
                    ),
                  ) ,
                ),
                SizedBox(height: 7.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '03',
                      style: GoogleFonts.workSans(fontSize: 20.sp, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 218, 48, 35), letterSpacing: 1),
                    ),
                    Text(
                      'Shaping sleep care Future',
                      style: GoogleFonts.workSans(fontSize: 15.sp, fontWeight: FontWeight.w600, color:Color(0xff1F1F1F), letterSpacing: 1),
                    ),
                    Text(
                      'AI tech for better apnea detection.',
                      style: GoogleFonts.workSans(fontSize: 13.sp, fontWeight: FontWeight.w500, color: Color(0xff64748B), letterSpacing: 1),
                    )
                  ],
                )
              ],
            ),



            SizedBox(height: 100.h),

            
            //Team members section
            Text(
              'BEHIND THE BLOCK',
              style: GoogleFonts.workSans(fontSize: 13.sp, fontWeight: FontWeight.w500, color: Color(0xff64748B), letterSpacing: 2),
              textAlign: TextAlign.center,
            ),


            // Title
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'OUR ',
                      style: GoogleFonts.workSans(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color:Color(0xff1F1F1F),
                        letterSpacing: 1,
                      ),
                    ),
                    TextSpan(
                      text: 'APNOXIA ',
                      style: GoogleFonts.workSans(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff64748B), 
                        letterSpacing: 1,
                      ),
                    ),
                    TextSpan(
                      text: 'TEAM',
                      style: GoogleFonts.workSans(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color:Color(0xff1F1F1F),
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),


            // Description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'A team of developers, engineers, and AI specialists united by a mission to transform sleep disorder diagnostics through technology and innovation.',
                style: GoogleFonts.workSans(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xff64748B), letterSpacing: 1),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 50),

            // Team Members
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MemberCard(name: 'Afraim Evra', role: 'Mobile Dev', picture: 'assets/WhatsApp Image 2025-04-13 at 10.59.25_ac19d7f0.jpg'),
                MemberCard(name: 'Fatma Ahmed', role: 'AI Developer', picture: 'assets/WhatsApp Image 2025-04-13 at 10.59.23_e7cc1405.jpg'),
                MemberCard(name: 'Hager Ahmed', role: 'AI Trainer', picture: 'assets/WhatsApp Image 2025-04-13 at 10.59.25_7b0c6d56.jpg'),
              ],
            ),

            const SizedBox(height: 10),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MemberCard(name: 'Abdelrahman Hagag', role: 'Back-end', picture: 'assets/IMG-20230201-WA0028.jpg'),
                MemberCard(name: 'Rima Ahmed', role: 'ML Trainer', picture: 'assets/WhatsApp Image 2025-04-13 at 11.01.56_5c93922c.jpg'),
                MemberCard(name: 'Malak Azab', role: 'DL Trainer', picture: 'assets/WhatsApp Image 2025-04-13 at 10.59.25_0dd48414.jpg'),
              ],
            ),

            
            // Divider
            Padding(
              padding: EdgeInsets.symmetric(vertical: 60.h),
              child: Divider(
                thickness: 0.5,
                color: Color(0xff64748B),
                indent: 30,
                endIndent: 30,
              ),
            ),
            


            // Contact Us Section
            Text(
              "Get in touch",
              style: GoogleFonts.workSans(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Color(0xff1F1F1F)),
            ),
            
            SizedBox(height: 10.h),
            
            Text(
              "We value collaboration, feedback, and innovation. If you’re a healthcare professional, researcher, or developer and have any concerns, suggestions or feedbacks. we would love to hear from you.",
              style: GoogleFonts.workSans(fontSize: 13.sp, fontWeight: FontWeight.w500, letterSpacing: 1, color: Color(0xff64748B)),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 20.h),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Color(0xffE0E7FF),
              ),
              child: SelectableText(
                "apneadetection@gmail.com",
                style: GoogleFonts.workSans(color: Color(0xff1F1F1F), fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),
            ),

            SizedBox(height: 150.h),
          ],
        ),
      ),
    );
  }
}
