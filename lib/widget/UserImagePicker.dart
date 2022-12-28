import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  Function(File? file) selectedImage;

  UserImagePicker(this.selectedImage, {Key? key}) : super(key: key);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? imageFile;

  void handleImage() async {
    final imagePicker = ImagePicker();
    XFile? xFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile?.path == null) return;
    File image = File(xFile!.path);
    widget.selectedImage(image);
    setState(() => imageFile = image);
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
        height: 120,
        width: 120,
        child: CircleAvatar(
          backgroundColor: Colors.black26,
          backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
        ),
      ),
      TextButton.icon(
        onPressed: handleImage,
        label: const Text("Adicionar uma imagem"),
        icon: const Icon(Icons.photo),
      )
    ]);
  }
}
