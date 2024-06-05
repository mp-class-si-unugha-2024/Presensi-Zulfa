import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi/app/routes/app_pages.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Card(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const Text(
                  "Presensi",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email wajib di isi";
                    }
                    if (!GetUtils.isEmail(value)) {
                      return "Masukan email dengan benar";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password wajib di isi";
                    }
                    if (value.length < 6) {
                      return "Password harus memiliki minimal 6 karakter";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    const Text("Show password"),
                  ],
                ),
                Row(
                  children: [
                    const Text("Lupa kata sandi"),
                    SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.HOME);
                        if (formkey.currentState!.validate()) {}
                      },
                      child: const Text("Masuk"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
