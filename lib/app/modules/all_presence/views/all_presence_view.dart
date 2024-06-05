import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_presence_controller.dart';

class AllPresenceView extends GetView<AllPresenceController> {
  const AllPresenceView({super.key});
  @override
  Widget build(BuildContext context) {
    print(controller.data);
    var data = controller.data;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SEMUA PRESENSI",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Form(
        child: ListView.separated(
          padding: const EdgeInsets.all(10),
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("check in"),
                      Text(
                        data[index]['waktuMasuk'],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("check out"),
                      Text(
                        data[index]['waktuKeluar'],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text("Jumat, 9 Juni 2024"),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 15,
            );
          },
          itemCount: data.length,
        ),
      ),
    );
  }
}
