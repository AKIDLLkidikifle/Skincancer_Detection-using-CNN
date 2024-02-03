import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiredash/wiredash.dart';
import 'onboarding_screen.dart';
import 'Pages/home.dart';
import 'Pages/management.dart';
import 'Pages/info.dart';
import "contacts/constant.dart";
import 'package:cancerapp/news_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import  "contacts/themdata.dart";
import   'thems/them-model.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
    runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [
        Locale('en'),
        Locale('am'),
        Locale('or'),
        Locale('fr'),
        Locale('es')

    ],
    path:"assets/translations",
    startLocale: const Locale('en'),
    
  ));
}

class MyApp extends StatefulWidget  {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
  
class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: projectid, 
      secret: secret, 
     navigatorKey: _navigatorKey,
      child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
           ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          })

      ],
      child:
      Consumer<DarkThemeProvider>(builder: (context, themeData, child){
        return   MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigatorKey,
        title: 'feedback page',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        theme: Styles.themeData(themeChangeProvider.darkTheme, context),
        locale: context.locale,
     
            
        home: Home());
      })
     
    )
    );//OnBoardingScreen());
  }
}
