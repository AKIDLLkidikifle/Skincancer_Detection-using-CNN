import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us".tr()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset("assets/blogo.jpg"),
          Text("we are".tr())
        ],
      ),
      
          
              
    );
  }
}