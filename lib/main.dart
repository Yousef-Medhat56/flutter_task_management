import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/features/todo/pages/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final defaultLightScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final defaultDarkScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.blue, brightness: Brightness.dark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return DynamicColorBuilder(
            builder: ((lightScheme, darkScheme) {
              return MaterialApp(
                title: 'Task Management',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  scaffoldBackgroundColor: AppConsts.kBkDark,
                  colorScheme: lightScheme ?? defaultLightScheme,
                  useMaterial3: true,
                ),
                themeMode: ThemeMode.dark,
                darkTheme: ThemeData(
                  scaffoldBackgroundColor: AppConsts.kBkDark,
                  colorScheme: darkScheme ?? defaultDarkScheme,
                  useMaterial3: true,
                ),
                home: const HomePage(),
              );
            }),
          );
        });
  }
}
