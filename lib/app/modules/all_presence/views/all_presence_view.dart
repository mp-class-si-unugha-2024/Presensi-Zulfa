import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_presence_controller.dart';

class AllPresenceView extends GetView<AllPresenceController> {
  const AllPresenceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("check in"),
                      Text(
                        "12:37 PM",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("check out"),
                      Text(
                        ".. : .. ..",
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
          itemCount: 5,
        ),
      ),
    );
  }
}
