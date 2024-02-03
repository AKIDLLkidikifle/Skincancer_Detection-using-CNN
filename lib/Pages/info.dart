import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../utils/dicription.dart';


class Info extends StatelessWidget {

   final DisInfo instance;
  const Info({super.key, required this.instance});
   

  @override
  Widget build(BuildContext context) {

List<Widget> _widgetList = <Widget>[
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("whatbasal".tr(),style: TextStyle(fontWeight: FontWeight.bold),),
      Text("dis1".tr()),
      Text("Symptombasal".tr(),style: TextStyle(fontWeight: FontWeight.bold),),
      Text("dis2".tr()),
      Text("Causebasal".tr(),style: TextStyle(fontWeight: FontWeight.bold)),
      Text("dis3".tr()),
      Text("Riskfactorbasal".tr(),style: TextStyle(fontWeight: FontWeight.bold),),
      Text("bis4".tr()),
    ],
      
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text("whatmelanoma".tr(),style: TextStyle(fontWeight: FontWeight.bold),),
      Text("diss1".tr()),
      Text("Symptommelanoma".tr(),style: TextStyle(fontWeight: FontWeight.bold),),
      Text("diss2".tr()),
      Text("Causemelanoma".tr(),style: TextStyle(fontWeight: FontWeight.bold)),
      Text("diss3".tr()),
      Text("Riskfactormelanoma".tr(),style: TextStyle(fontWeight: FontWeight.bold),),
      Text("biss4".tr()),
      ],
    ),
    
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("whatnormal".tr(),),
        const SizedBox(
          height: 10.0,
        ),
      ],
    ),

    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text("whatpigmented".tr(),style: TextStyle(fontWeight: FontWeight.bold),),
      Text("disss1".tr()),
      Text("SymptomPigmented".tr(),style: TextStyle(fontWeight: FontWeight.bold),),
      Text("disss2".tr()),
      Text("RiskfactorPigmented".tr(),style: TextStyle(fontWeight: FontWeight.bold)),
      Text("dis3".tr()),
      Text("Riskfactorbasal".tr(),style: TextStyle(fontWeight: FontWeight.bold),),
      Text("bisss4".tr()),
      ],
    
    ),  
  
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("NotSkin Definition"),
        const SizedBox(
          height: 10.0,
        ),
      ],
    ),
  ];

  Map desc = {
    'BASAL'.tr(): _widgetList[0],
    'MELANOMA'.tr(): _widgetList[1],
    'NORMAL'.tr(): _widgetList[2],
    'PIGMENT'.tr(): _widgetList[3],
    'Not skin'.tr(): _widgetList[4],
  };




    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  Text(
          "Information".tr(),
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
            height: MediaQuery.of(context).size.height * 0.5,
            decoration:  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/${instance.pic}'), fit: BoxFit.fill),
                ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(30))),
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
            desc[instance.SkinsDiseases],
              ],
            ),
          ),
   
        ],
      ),
    );;
  }
}