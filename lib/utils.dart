import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<List<int>?> pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  try {
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print("No image selected");
      return null;
    }
  } catch (e) {
    print("Error picking image: $e");
    return null;
  }
}
