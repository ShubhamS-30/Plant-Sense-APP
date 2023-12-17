import 'package:plant_sense_1/BardAIController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BardAIController controller = Get.put(BardAIController());
    TextEditingController textField = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xfff2f1f9),
      appBar: AppBar(
        centerTitle: true,
        leading: SvgPicture.asset(
          "assets/bard_logo.svg",
          width: 10,
        ),
        title: Text(
          "Support",
          style: GoogleFonts.ebGaramond(
              fontWeight: FontWeight.w700,
              fontSize: 40,
              color: Colors.white,
              fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                controller.sendPrompt("Hello what can you do for me ");
              },
              icon: const Icon(Icons.security))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Obx(() => Column(
                      children: controller.historyList
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Text(e.system == "user" ? "👨‍💻" : "🤖"),
                                  const SizedBox(width: 10),
                                  Flexible(child: Text(e.message)),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ))
              ],
            )),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              child: Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: textField,
                    decoration: const InputDecoration(
                        hintText: "Ask me anything",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : IconButton(
                          onPressed: () {
                            if (textField.text != "") {
                              controller.sendPrompt(textField.text);
                              textField.clear();
                            }
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          )),
                ),
                const SizedBox(width: 10)
              ]),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
