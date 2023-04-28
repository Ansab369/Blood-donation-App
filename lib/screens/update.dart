// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateUser extends StatelessWidget {
  UpdateUser({super.key});

  final bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];
  String? selectedGruop;

  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void updateDonor(id) {
    final data = {
      'name': nameController.text,
      'phone': phoneController.text.toString(),
      'group': selectedGruop,
      'id': id,
    };
    donor.doc(id).update(data);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = args['name'];
    phoneController.text = args['phone'];
    selectedGruop = args['group'];
    final id = args['id'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Update Donor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Donor Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
            ),
            SizedBox(height: 16.0),
            Text('Blood Group'),
            DropdownButtonFormField(
              value: selectedGruop,
              onChanged: (value) {
                selectedGruop = value;
              },
              items: bloodGroups.map((bloodGroup) {
                return DropdownMenuItem(
                  value: bloodGroup,
                  child: Text(bloodGroup),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  minimumSize: MaterialStateProperty.all(
                    Size(double.infinity, 50),
                  ),
                ),
                onPressed: () {
                  updateDonor(id);
                  Navigator.pop(context);
                },
                child: Text(
                  'Update',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
