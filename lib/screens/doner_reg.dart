import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:helloworld/screens/startscreen.dart';
import 'package:image_picker/image_picker.dart';

class DonorRegistrationScreen extends StatefulWidget {
  @override
  _DonorRegistrationScreenState createState() =>
      _DonorRegistrationScreenState();
}

class _DonorRegistrationScreenState extends State<DonorRegistrationScreen> {
  TextEditingController pickUpLocationController = TextEditingController();
  TextEditingController foodDescriptionController = TextEditingController();
  TextEditingController serversController = TextEditingController();
  DateTime? expiryDate;
  List<String> foodTypes = ['Leftover', 'Packed', 'Homemade', 'Other'];
  String? selectedFoodType;
  XFile? selectedImage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: pickUpLocationController,
              decoration: InputDecoration(labelText: 'Pick-up Location'),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedFoodType,
              onChanged: (newValue) {
                setState(() {
                  selectedFoodType = newValue;
                });
              },
              items: foodTypes.map((type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Type of Food'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: foodDescriptionController,
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Food Description'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: serversController,
              decoration: InputDecoration(labelText: 'Servers'),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );

                if (selectedDate != null) {
                  setState(() {
                    expiryDate = selectedDate;
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.all(8.0),
                child: Text(
                  expiryDate != null
                      ? 'Expiry Date: ${expiryDate!.toLocal()}'.split(' ')[0]
                      : 'Select Expiry Date',
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                XFile? file = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (file != null) {
                  setState(() {
                    selectedImage = file;
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.all(8.0),
                child: Text(
                  selectedImage != null ? 'Image selected' : 'Select Image',
                ),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Implement donor registration logic here
                // Access the selectedImage if needed
                if (selectedImage != null) {
                  print('Selected Image Path: ${selectedImage!.path}');
                } else {
                  print('No image selected.');
                }
              },
              child: Text('Register as Donor'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: DonorRegistrationScreen()));
}