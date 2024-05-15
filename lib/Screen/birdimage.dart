// Import necessary packages
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class BirdPage extends StatefulWidget {
  const BirdPage({Key? key}) : super(key: key);

  @override
  _BirdPageState createState() => _BirdPageState();
}

class _BirdPageState extends State<BirdPage> {
  File? _filePath;
  String _label = '';
  double _confidence = 0.0;

  Future<void> _tfLiteInit() async {
    try {
      await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
      );
    } catch (e) {
      print("Failed to load model: $e");
    }
  }

  Future<void> _pickImageGallery() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    _processImage(File(image.path));
  }

  
  Future<void> _pickImageCamera() async {
  final picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.camera);
   
  if (image == null) return; // Cancelled or no image selected

  _processImage(File(image.path));
}


  Future<void> _processImage(File imageFile) async {
    setState(() {
      _filePath = imageFile;
    });

    List<dynamic>? recognitions = await Tflite.runModelOnImage(
      path: imageFile.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
      
      asynch: true,
    );

    if (recognitions == null || recognitions.isEmpty) {
      Fluttertoast.showToast(msg: "Recognition failed");
      return;
    }

    setState(() {
      _confidence = (recognitions[0]['confidence'] * 100);
      _label = recognitions[0]['label'].toString();
    });
  }

  void _generateBirdInformation() async {
    if (_label.isEmpty) {
      Fluttertoast.showToast(msg: "Please upload an image first");
      return;
    }

    final apiKey = "AIzaSyClSiA-MgetF-GLRyVwEI_-mJDvjPkH5Xc";
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    final content = [Content.text("Generate Information of the Bird $_label")];

    try {
      final response = await model.generateContent(content);
      final generatedContent = response.text!;
      _showDialog("Facts about the Bird", generatedContent);
    } catch (e) {
      print("Failed to generate content: $e");
      Fluttertoast.showToast(msg: "Failed to generate content");
    }
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(content),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _tfLiteInit();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Who am I?"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 12),
              Card(
                elevation: 20,
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      SizedBox(height: 18),
                      Container(
                        height: 280,
                        width: 280,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          image: _filePath != null
                              ? DecorationImage(
                                  image: FileImage(_filePath!),
                                  fit: BoxFit.fill,
                                )
                              : null,
                        ),
                        child: _filePath == null ? Text('') : SizedBox(),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              _label,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Accuracy: ${_confidence.toStringAsFixed(0)}%",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: _pickImageCamera,
                              child: Text("Take a Photo"),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: _pickImageGallery,
                              child: Text("Pick from Gallery"),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: _generateBirdInformation,
                              child: Text("Generate Bird Information"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
