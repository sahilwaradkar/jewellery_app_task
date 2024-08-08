import 'package:flutter/material.dart';
import 'package:inventory_management/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'controller/home/home_controller.dart';
import 'core/constants/image_resource.dart';
import 'core/utils/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeController>(create: (_) => HomeController()),
      ],
      child: MaterialApp(
        title: 'Inventory Management',
          theme: MyTheme.theme,
        debugShowCheckedModeBanner: false,
        home: Container(decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageResource.bgImage),
            fit: BoxFit.cover,
          ),
        ),child: const HomeScreen()),
      ),
    );
  }
}
