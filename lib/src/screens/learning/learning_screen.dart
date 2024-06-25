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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF004D40), Color.fromARGB(255, 182, 204, 203)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: -30,
            child: Transform.rotate(
              angle: -0.1,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            right: -40,
            child: Transform.rotate(
              angle: 0.1,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            right: -30,
            child: Transform.rotate(
              angle: -0.2,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            left: -50,
            child: Transform.rotate(
              angle: 0.2,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Obx(() {
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
                            color: Color.fromARGB(255, 0, 77, 64),
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
                                color: Colors.white,
                                fontSize: 16,
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
                                wordName: word.name,
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
        ],
      ),
    );
  }
}
