import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    var isObscure = true.obs;
    var selectedProdi = ''.obs;

    final List<String> prodiList = [
      'Teknik Informatika (TI)',
      'Sistem Informasi (SI)',
      'Matematika (MAT)',
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Card(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "REGISTRASI",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "NIM",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Semester",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  Obx(() => DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Pilih Prodi",
                          border: OutlineInputBorder(),
                        ),
                        value: selectedProdi.value.isEmpty
                            ? null
                            : selectedProdi.value,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            selectedProdi.value = newValue;
                          }
                        },
                        items: prodiList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(Icons.male),
                        label: Text('Laki-laki'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                      ElevatedButton.icon(
                        icon: Icon(Icons.female),
                        label: Text('Perempuan'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade50,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Alamat PKL",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nomor WhatsApp",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  Obx(() => TextFormField(
                        obscureText: isObscure.value,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscure.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              isObscure.value = !isObscure.value;
                            },
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
