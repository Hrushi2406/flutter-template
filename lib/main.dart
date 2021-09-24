import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'core/utils/size_config.dart';
import 'home.dart';
import 'locator.dart' as di;
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (context) => locator<ThemeProvider>(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig.init(
          screenSize: Size(constraints.maxWidth, constraints.maxHeight),
          orientation: orientation,
        );

        return Consumer<ThemeProvider>(
          builder: (context, provider, child) {
            return MaterialApp(
              title: 'App',
              theme: AppTheme.light(),
              darkTheme: AppTheme.dark(),
              themeMode: provider.currentTheme,
              home: const Home(),

              // home: Home(),
            );
          },
        );
      });
    });
  }
}
