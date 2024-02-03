import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import './select_button.dart';
class SelectPhotoOptionsScreen extends StatelessWidget {
  final Function(ImageSource source) onTap;
  const SelectPhotoOptionsScreen({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      //color: Colors.pink,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: -30,
              child: Container(
                width: 60,
                height: 6,
                color: Colors.grey.shade400,
              )),
          Column(
            children: [

              Text("when".tr(), style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
                 const SizedBox(
                height: 30,
              ),
              SelectPhoto(
                  textLabel: "browthgalery".tr(),
                  icon: Icons.image,
                  onTap: () => onTap(ImageSource.gallery)),
              const SizedBox(
                height: 30,
              ),
              SelectPhoto(
                  textLabel: "Camera".tr(),
                  icon: Icons.camera,
                  onTap: () => onTap(ImageSource.camera))
            ],
          )
        ],
      ),
    );
  }
}