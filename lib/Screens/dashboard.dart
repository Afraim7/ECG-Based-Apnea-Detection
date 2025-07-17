import 'package:apnoxia/Components/apnoxiabottombar.dart';
import 'package:apnoxia/Cubit/apnoxiacubit.dart';
import 'package:apnoxia/Cubit/apnoxiastates.dart';
import 'package:apnoxia/Screens/aboutapnoxia.dart';
import 'package:apnoxia/Screens/upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {
  int screenIndex = 0; 

  void changeScreen(int index) {
    setState(() {
      screenIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {    
    return BlocBuilder<Apnoxiacubit, ApnoxiaState>(
      builder: (context, state) {

        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              body: IndexedStack(
                index: screenIndex, 
                children: [
                  Upload(),
                  AboutApnoxia(),
                ],
              ),
            ),
            Positioned(
              bottom: 20.h,
              left: 20.w,
              right: 20.w,
              child: ApnoxiaBottomBar(
                selectedIndex: screenIndex, 
                onItemTapped: changeScreen,
              ),
            ),
          ],
        );
      },
    );
  }
}
