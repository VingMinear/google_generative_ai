import 'package:ai_app/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Selected extends StatelessWidget {
  const Selected({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCon = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: DropdownButton<String>(
          onChanged: (value) {
            homeCon.selectedItems(value!);
            // selectedItem = value!;
          },
          // hint: const Text("Please select"),
          value: homeCon.selectedItem,
          items: homeCon.dropdownItems.map((e) {
            return DropdownMenuItem<String>(
              value: e,
              child: Text(
                e,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
