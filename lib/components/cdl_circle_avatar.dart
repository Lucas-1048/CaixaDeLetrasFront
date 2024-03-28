import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CDLCircleAvatar extends StatefulWidget {
  const CDLCircleAvatar({super.key});

  @override
  State<CDLCircleAvatar> createState() => _CDLCircleAvatarState();
}

class _CDLCircleAvatarState extends State<CDLCircleAvatar> {
  XFile? profilePhoto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _getPhotoFromGallery,
      splashColor: Colors.grey.shade200,
      splashFactory: InkRipple.splashFactory,
      child: CircleAvatar(
        radius: 48,
        child: Stack(
          alignment: Alignment.center,
          children: [
            profilePhoto != null
                ? ClipOval(
                    child: Image.file(
                    File(profilePhoto!.path),
                    width: 96,
                    height: 96,
                    fit: BoxFit.cover,
                  ))
                : const SizedBox(),
            const Icon(
              Icons.camera_alt_outlined,
              size: 24,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _getPhotoFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        profilePhoto = pickedFile;
      });
    }
  }
}
