import 'package:get/get.dart';
import 'package:proyecto_sw1_movil/src/providers/learning_provider.dart';
import 'package:proyecto_sw1_movil/src/models/category_word.dart';

class LearningController extends GetxController {
  var categories = <Category>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLearningCategories();
  }

  Future<void> fetchLearningCategories() async {
    try {
      isLoading(true);
      var categoryWord = await LearningProvider().getLearningCategories();
      categories.assignAll(categoryWord.categories);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
