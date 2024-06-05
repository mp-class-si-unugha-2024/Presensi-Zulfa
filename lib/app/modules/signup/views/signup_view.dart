import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Form(
              key: formkey,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "REGISTRASI",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "NIM",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Semester",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(() => DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
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
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.male),
                        label: const Text('Laki-laki'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.female),
                        label: const Text('Perempuan'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade50,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Alamat PKL",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Nomor WhatsApp",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(() => TextFormField(
                        obscureText: isObscure.value,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: const OutlineInputBorder(),
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
