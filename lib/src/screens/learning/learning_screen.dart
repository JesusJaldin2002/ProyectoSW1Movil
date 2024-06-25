import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'learning_controller.dart';
import 'word_detail_screen.dart'; // Importa la nueva pantalla

class LearningScreen extends StatelessWidget {
  final LearningController controller = Get.put(LearningController());

  LearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sección de Aprendizaje',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF004D40),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error: ${controller.errorMessage}',
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: controller.fetchLearningCategories,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 77, 64),
                  ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              var category = controller.categories[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 150, 200, 180),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          category.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 107, 107, 107),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    ...category.words.map((word) {
                      return ListTile(
                        leading: const Icon(Icons.bookmark_outline_rounded, color: Color.fromARGB(255, 0, 77, 64)),
                        title: Text(
                          word.name,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        onTap: () {
                          Get.to(() => WordDetailScreen(
                            category: category.name,
                            gifPath: word.gifPath,
                          ));
                        },
                      );
                    }),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
