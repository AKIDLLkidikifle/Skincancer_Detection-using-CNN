
import 'package:cancerapp/Pages/news.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import './info.dart';
import '../utils/dicription.dart';
import '../utils/list.dart';

class ListDisease extends StatefulWidget {
  const ListDisease({super.key});

  @override
  State<ListDisease> createState() => _ListDiseaseState();
}



class _ListDiseaseState extends State<ListDisease> {
  List<DisInfo> disease = [
    DisInfo(SkinsDiseases: 'BASAL'.tr(), pic: 'basale.jpg'),
    DisInfo(SkinsDiseases: 'MELANOMA'.tr(), pic: 'Melanoma.jpg'),
    DisInfo(SkinsDiseases: 'NORMAL'.tr(), pic: 'normal.jpg'),
    DisInfo(SkinsDiseases: 'PIGMENT'.tr(), pic: 'pigment.jpg'),
  ];

  List<Cat> catagory = [
    Cat(catagory: 'health'.tr(), icon:Icons.newspaper_outlined),
    Cat(catagory: 'general'.tr(), icon:Icons.voice_chat),
    Cat(catagory: 'technology'.tr(), icon:Icons.local_activity),
    Cat(catagory: 'science'.tr(), icon:Icons.monitor_heart),
  ];
    void showInfo(index) {
   DisInfo instance = disease[index];
       Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>Info(instance:instance ,)),
                );
  }
  void me(m) {
    String name = catagory[m].catagory;
       Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>News(name:name)));        
  }

  final ButtonStyle style = TextButton.styleFrom(
      backgroundColor:Colors.white ,
     // elevation: 10,
      fixedSize: const Size(150, 300),
      padding: const EdgeInsets.all(15),
      shape: const StadiumBorder(
          side: BorderSide(color: Colors.indigo, width: 1.0)));

 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Row(
            children:  [
              Text(
                "hey".tr(),
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.waving_hand_outlined, color: Colors.indigo)
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 30, 15, 10),
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.indigo,width: 1.3)
               ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/doc1.png'.tr(),
                  width: 150,
                  height: 150,
                ),
                 Expanded(
                    child: Text(
                  "getletest".tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, letterSpacing: 1.2),
                ))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 20, 15),
          child: Row(
            children: [
              Text(
                "browthletest".tr(),
                style: TextStyle(
                    color: Colors.black, letterSpacing: 1.1, fontSize: 17),
                    overflow: TextOverflow.ellipsis
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.language,
                color: Colors.indigo,
                size: 30,
              )
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.0998,
          padding: EdgeInsets.all(10),
         // margin:EdgeInsets.symmetric(horizontal: 5),
          margin: EdgeInsets.zero,
           child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: catagory.length,
            
            itemBuilder: (context, index){
             return Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
               child: TextButton(
                     
                    onPressed:(){
                      me(index);
                    },
                    style: style,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          catagory[index].icon,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          catagory[index].catagory,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    )),
             );
             
            } 
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 20, 15),
          child: Row(
            children: [
              Text(
                "skincancertype".tr(),
                style: TextStyle(
                    color: Colors.black, letterSpacing: 1.1, fontSize: 17),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
            Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: disease.length,
            
            itemBuilder: (context, index){
             return GestureDetector(
                onTap: () {
                showInfo(index);
                },
              child: Card( name:disease[index].SkinsDiseases.toLowerCase(),pic: disease[index].pic,),
             );
             
            } 
          ),
        )
    
      ],
    );
  }
}

class Card extends StatelessWidget {
   final String name;
   final String pic;
  const Card(
      {super.key,
      // required this.name,
      required this.name,
      /*required this. border*/
      required this.pic});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 5, 0, 10),
      padding: const EdgeInsets.all(13.0),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.indigo, width: 1.3),
          borderRadius: BorderRadiusDirectional.circular(15),
          color:Colors.white),
      child: Column(
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage( 'assets/${pic}'),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.2,
                fontSize: 18),
          )
        ],
      ),
    );
  }
}
