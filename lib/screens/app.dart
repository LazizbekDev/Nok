import 'package:flutter/material.dart';
import 'package:nok/routes/app_routes.dart';
import 'package:nok/routes/route_names.dart';
import 'package:nok/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData,
          initialRoute: RouteNames.home,
          onGenerateRoute: generateRoute,
        ),
      ),
    );
  }
}
