

import 'package:cancerapp/utils/managemnt.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import './resource.dart';




class Management extends StatelessWidget {
  
   final Managementinfo instance;
   
  const Management({super.key, required this.instance });

   
    
  @override
  Widget build(BuildContext context) {

     List<String> management= [
            "basalprediction".tr(),
            "melanomaprediction".tr(),
            "normalprediction".tr(),
            "pigmentedprediction".tr(),
            "notskinprediction".tr()
          
           
            ];
              Map desc = {
                  'BASAL'.tr(): management[0],
                  'MELANOMA'.tr(): management[1],
                  'NORMAL'.tr(): management[2],
                  'PIGMENT'.tr(): management[3],
                  'NOT SKIN'.tr():management[4],
  };
   
    //print(  desc[instance.SkinsDiseases.tr()]);
    void nav(){
    Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Resource() ),
                );
    }
    

      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Management",
          style: TextStyle(letterSpacing: 1.5, fontSize: 22),
        ),
        actionsIconTheme: IconThemeData.fallback(),
        centerTitle: true,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration:  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/${instance.pic}'), fit: BoxFit.fill),
                borderRadius: BorderRadiusDirectional.vertical(
                    bottom: Radius.circular(30))),
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(30),
            children:  [
              Text(
                "name".tr(),
                style: TextStyle(fontSize: 24, letterSpacing: 1),
              ),
              Text(
                instance.SkinsDiseases,
                style: TextStyle(
                    fontSize: 24, color: Colors.indigoAccent, letterSpacing: 1),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
              desc[instance.SkinsDiseases.tr()],
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