import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../utils/dicription.dart';

class Prediction extends StatefulWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  State<Prediction> createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  static TextStyle optionStyle1 = TextStyle(
      fontSize: 21, fontWeight: FontWeight.bold, color: Colors.grey[600]);

  bool isSpeaking = false;

  static final List<Widget> _widgetList = <Widget>[
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Prevention".tr(), style: optionStyle1).tr(),
        Row(children: [
          Text('One'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfBasalOne'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Two'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfBasalTwo'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Three'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfBasalThree'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Four'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfBasalFour'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Five'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfBasalFive'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Prevention".tr(), style: optionStyle1).tr(),
        Row(children: [
          Text('One'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfMelanomaOne'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Two'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfMelanomaTwo'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Three'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfMelanomaThree'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Four'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfMelanomaFour'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Five'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfMelanomaFive'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
      ],
    ),
    
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("HealthyDefinition".tr(), style: optionStyle1),
        const SizedBox(
          height: 10.0,
        ),
      ],
    ),

    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Prevention".tr(), style: optionStyle1).tr(),
        Row(children: [
          Text('One'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfPigmenteOne'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Two'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfPigmentTwo'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Three'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfPigmentThree'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Four'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfPigmentFour'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
        Row(children: [
          Text('Five'.tr()),
          Expanded(
              child: Text(
            'ManagmentOfPigmentFive'.tr(),
            textAlign: TextAlign.justify,
          ))
        ], crossAxisAlignment: CrossAxisAlignment.start),
      ],
    ),  
  
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("NotSkinDefinition".tr(), style: optionStyle1),
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
  
  @override
  Widget build(BuildContext context) {
    DisInfo instance = ModalRoute.of(context)!.settings.arguments as DisInfo;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 97, 161, 213),
        title: const Text('Prevention').tr(),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ElevatedButton(
              //     onPressed: () {
              //       isSpeaking ? stop() : speak();
              //     },
              //     child: Text(isSpeaking ? "stop" : "speak")),
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                height: 200,
                width: 900,
                // AssetImage('assets/leafimages/${instance.pic}'),
                child: Image.asset('assets/skinimages/${instance.pic}'),
              ),
              const Divider(
                height: 30.0,
                color: Colors.amber,
              ),
              Text('Name'.tr(),
                  style: TextStyle(
                      color: Colors.grey[600],
                      letterSpacing: 2.0,
                      fontSize: 21,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 10.0),
              Text(instance.SkinsDiseases.tr(),
                  style: TextStyle(
                      color: Colors.orange[700],
                      letterSpacing: 2.0,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 30.0),
              desc[instance.SkinsDiseases.tr()],
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
