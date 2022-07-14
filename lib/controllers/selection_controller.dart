import 'package:get/get.dart';

class SelectionController extends GetxController {
  String selectedEvent = "1";
  RxString selectedSportName = "Football".obs;
  List<Map<String, dynamic>> eventOP = [];
}
