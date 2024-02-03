import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import './home.dart';
import 'package:http/http.dart' as http;

class Language {
  Locale locale;
  String langName;
  Language({
    required this.locale,
    required this.langName,
  });
}

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  List<Language> languageList = [
    Language(
      langName: 'English',
      locale: const Locale('en'),
    ),
    Language(
      langName: 'አማርኛ',
      locale: const Locale('am'),
    ),
    Language(
      langName: 'Afann Oromo',
      locale: const Locale('or'),
    ),
    Language(
      langName: 'ትግርኛ',
      locale: const Locale('fr'),
    ),
    Language(
      langName: 'Somali',
      locale: const Locale('es'),
    ),
  ];

  Language? selectedLang;

  @override
  Widget build(BuildContext context) {
    selectedLang = languageList.singleWhere((e) => e.locale == context.locale);
    double width = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // TextButton(
            //     onPressed: () async {
            //       var url = Uri.https(
            //           'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={b67ecd174b485eaa9635e420d17cf1d4}');
            //       var response = await http.get(url);
            //       print("response status:${response.statusCode}");
            //       print("response status:${response.body}");
            //     },
            //     child: const Text('get data')),
            const SizedBox(
              height: 60,
            ),
            Container(
              child: Text(
                "choosetitle".tr(),
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: width,
              height: h * 0.4,
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DropdownButton<Language>(
                    iconSize: 35,
                    elevation: 25,
                    value: selectedLang,
                    underline: Container(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                    ),
                    onChanged: (newValue) async {
                      setState(() {
                        selectedLang = newValue!;
                        // _flutterTts.setLanguage(selectedLang as String);
                      });
                      if (newValue!.langName == 'English') {
                       await context.setLocale(const Locale('en'));
                        // _flutterTts.setVoice('en-US');
                      } 
                      else if (newValue.langName == 'አማርኛ') {
                       await context.setLocale(const Locale('am'));
                      } else if (newValue.langName == 'Afann Oromo')
                       {
                      await  context.setLocale(const Locale('or'));
                      }
                       else if (newValue.langName == 'ትግርኛ') 
                       {
                     await   context.setLocale(const Locale('fr'));
                      }
                      else if (newValue.langName == 'Somali')
                       {
                     await   context.setLocale(const Locale('es'));
                      }
                       await   Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    items: languageList
                        .map<DropdownMenuItem<Language>>((Language value) {
                      return DropdownMenuItem<Language>(
                        value: value,
                        child: Text(
                          value.langName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
