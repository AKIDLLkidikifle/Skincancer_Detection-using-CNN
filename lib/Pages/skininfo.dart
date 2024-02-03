import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Skin extends StatelessWidget {
  const Skin({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  
      appBar: AppBar(
      
        title:  Text(
          "skin".tr(),
          style: TextStyle(letterSpacing: 1.5, fontSize: 22 , color: Colors.black),
        ),
      //  actionsIconTheme: IconThemeData.fallback(),
        centerTitle: true,
        elevation: 0,
      ),
    
      body: Column(
        children: [
      
          Expanded(
              child: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(30),
            children:  [
           
              Text(
                "What".tr(),
                style: TextStyle(
                    fontSize: 24, color: Colors.indigoAccent, letterSpacing: 1),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
              "Skicancern".tr(),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  letterSpacing: 0.8,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 5,
              ),
                 Text(
              "UV rays".tr(),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  letterSpacing: 0.8,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 5,
              ),
                 Text(
              "Can".tr(),
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.indigo,
                  letterSpacing: 0.8,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 5,
              ),
                     Text(
              "Nearly".tr(),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  letterSpacing: 0.8,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 5,
              ),
           
            ],
          )),
        
        ],
      ),
    );
  }
}