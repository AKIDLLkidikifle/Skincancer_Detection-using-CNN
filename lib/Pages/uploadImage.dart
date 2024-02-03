import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/managemnt.dart';
import '../dl_model/processing_model.dart';
import '../Pages/management.dart';
import 'select_button.dart';
import "./select_photo_screen.dart";

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  void initState() {
    super.initState();
  }

  File? imagee;
  
   

  Future _ImagePicker(ImageSource source) async {
    try {
       final image = await ImagePicker().pickImage(source: source);
       print("picked");
    
      if (image == null) return;
        
       File? img = File(image.path);
       print(img.path);
      setState(() {
        imagee = img;
        Navigator.of(context).pop();
       // print("image data "+Image.path);
       print("image pcked");
      });
       print("abt to be classifide");
      final outputs = await classifier.classifyImage(imagee);
      print("classifide");
      setState(() {
        skinDisease = outputs![0]['label'].toString().toLowerCase();
      
        print(skinDisease);
        print("stored");
       solutionOne(skinDisease);
          
      });
    } catch (e) {
      Navigator.of(context).pop();
    }
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        //isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.6,
            maxChildSize: 0.8,
            minChildSize: 0.6,
            expand: false,
            builder: (context, ScrollController) {
              return SingleChildScrollView(
                controller: ScrollController,
                child:SelectPhotoOptionsScreen(onTap:_ImagePicker,)
                  //onTap: _pickImage,
              );
            }));
  }

   List<Managementinfo> management= [
    Managementinfo(SkinsDiseases: 'BASAL'.tr(),pic: 'basale.jpg',),
    Managementinfo(SkinsDiseases: 'MELANOMA'.tr(),pic: 'Melanoma.jpg',),
    Managementinfo(SkinsDiseases: 'NORMAL'.tr(),pic: 'normal.jpg'),
    Managementinfo(SkinsDiseases: 'PIGMENT'.tr(),pic: 'pigment.jpg'),
    Managementinfo(SkinsDiseases: 'NOT SKIN'.tr(), pic: 'doc1.png',),
  //  DisInfo(SkinsDiseases: 'Not skin'.tr(), pic: 'pigment.jpg'),
  ];

  solutionOne( String m) {
    

    switch (m) {
      case 'basal':
        Managementinfo instance = management[0];
        //  DisInfo pic = disease[0];
        Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>Management(instance: instance)),
                );
        break;
      case 'melanoma':
        print("hey they there".tr());
        Managementinfo instance = management[1];
        Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>Management(instance: instance,)),
                );
                
        break;

      case 'normal':
        Managementinfo instance = management[2];
        Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>Management(instance: instance,)),
                );
        break;

      case 'pigmented':
        Managementinfo instance = management[3];
        Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>Management(instance:instance ,)),
                );
        break;
      case 'not skin':
        Managementinfo instance = management[4];
        Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>Management(instance:instance ,)),
                );
        break;
      // case 'Not skin':
      //   DisInfo instance = disease[4];
      //   Navigator.pushNamed(context, '/Prediction', arguments: instance);
      //   break;
      // case 'Not mango':
      //   DisInfo instance = disease[3];
      //   Navigator.pushNamed(context, '/Prediction', arguments: instance);
      //   break;
      default:
      // print("Other");
    }
  }

  final Classifier classifier = Classifier();

   String skinDisease = "";
   String confidence = "";
  late int index;
    
 // final ButtonStyle style = 
  void upLoad() {
    print("hwllo mf");
  }






  @override
  Widget build(BuildContext context) {

     ThemeData currentTheme = Theme.of(context);
     Color bgw = currentTheme.brightness==Brightness.dark ? Color.fromRGBO(16, 20, 28, 1):Colors.grey.shade300;
     Color bcolor = currentTheme.brightness==Brightness.dark ? Color.fromRGBO(16, 20, 28, 1):Colors.indigo;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.4,
              color: bgw,
              child: Stack(
                alignment: Alignment.bottomCenter,
                
                clipBehavior: Clip.none,
                children: [
               Positioned( 
                top: 5,
                left: 50,
                
                child:   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                    Text("upload".tr(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                   
                   ],
                  ),),
                     Positioned( 
                top: 20,
                right: 50,
                
                child:   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                    Text("detect".tr(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.indigo),),
                   
                   ],
                  ),),
                  Positioned(
                      top: 0,
                      bottom: -220,
                      
                      left: MediaQuery.of(context).size.width * 0.06,
                      child: Image.asset(
                        "assets/upload.png",
                        width: 400,
                        height: 400,
                      ))
                ],
              )),
      /*  ElevatedButton.styleFrom(
      backgroundColor: Colors.indigo,
      padding: const EdgeInsets.all(10),
      shape: const StadiumBorder());*/
          Container(
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
            child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                   backgroundColor:bcolor,
                   padding: const EdgeInsets.all(10),
                  shape: const StadiumBorder()
                ),
                onPressed: () async {
                  _showSelectPhotoOptions(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Uploadimage".tr(),
                      style: TextStyle(fontSize: 18, letterSpacing: 1.5),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.upload_file,
                      size: 40,
                      color: Colors.white,
                    )
                  ],
                )),
          ),
            

             
        ],
      ),
    );
  }
}