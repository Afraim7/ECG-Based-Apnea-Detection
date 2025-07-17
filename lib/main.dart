import 'package:apnoxia/Cubit/apnoxiacubit.dart';
import 'package:apnoxia/Screens/dashboard.dart';
import 'package:apnoxia/Screens/intro.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      isToolbarVisible: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => Apnoxiacubit()), 
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: DevicePreview.appBuilder,
            initialRoute: '/intro',
            routes: {
              '/intro': (context) => const Intro(),
              '/dashboard': (context) => const Dashboard(),
            },
          ),
        );
      },
    );
  }
}
