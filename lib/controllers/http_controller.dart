import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mostrates_sports/constants/strings.dart';
import 'package:mostrates_sports/controllers/selection_controller.dart';
import 'package:mostrates_sports/models/category.dart';
import 'package:mostrates_sports/models/match.dart';

import '../models/event.dart';

class HttpController {
  SelectionController _selectionController = Get.find<SelectionController>();
  Future<List<Category>> getCategories() async {
    List<Category> _categoryList = [];
    var response = await http.get(Uri.parse(GET_CATEGORIES),
        headers: {"Package": "KlUet6y43te8Jg6G9bkDxN36f9X9ZiTkm"});

    if (response.statusCode == 200) {
      print("Response received");
      print(response.body);
      for (int i = 0; i < jsonDecode(response.body)['body'].length; i++) {
        _categoryList
            .add(Category.fromJson(jsonDecode(response.body)['body'][i]));
      }
      return _categoryList;
    } else {
      print("Server did not respond: Status code: ${response.statusCode}");

      throw Exception('Failed to load categories');
    }
  }

  Future<Event> getEvents(String eventId) async {
    var response = await http.get(
        Uri.parse("https://betapilive.com/v1/events/" +
            eventId +
            "/0/sub/10/line/en"),
        headers: {"Package": "KlUet6y43te8Jg6G9bkDxN36f9X9ZiTkm"});

    if (response.statusCode == 200) {
      print("Response received");
      print(response.body);
      print("Event parse -----------> BEGIN");
      // _selectionController.eventOP = json.decode(response.body)['body'][];
      _selectionController.eventOP.clear();
      for (int i = 0; i < jsonDecode(response.body)['body'].length; i++) {
        for (int j = 0;
            j < jsonDecode(response.body)['body'][i]['events_list'].length;
            j++) {
          _selectionController.eventOP.add({
            "home": jsonDecode(response.body)['body'][i]['events_list'][j]
                    ['game_oc_list'][0]['oc_rate']
                .toString(),
            "draw": jsonDecode(response.body)['body'][i]['events_list'][j]
                    ['game_oc_list'][1]['oc_rate']
                .toString(),
            "away": jsonDecode(response.body)['body'][i]['events_list'][j]
                    ['game_oc_list'][2]['oc_rate']
                .toString(),
          });
        }
      }
      print(_selectionController.eventOP);
      Event _event = await Event.fromJson(jsonDecode(response.body));
      print("Event parse -----------> END");
      print(_event);
      return _event;
    } else {
      print("Server did not respond: Status code: ${response.statusCode}");

      throw Exception('Failed to load events');
    }
  }

  Future<Match> getMatch(String matchId) async {
    var response = await http.get(
        Uri.parse(
            "https://betapilive.com/v1/event/" + matchId + "/list/line/en"),
        headers: {"Package": "KlUet6y43te8Jg6G9bkDxN36f9X9ZiTkm"});
    if (response.statusCode == 200) {
      print("Response received");
      print(response.body);
      return Match.fromJson(jsonDecode(response.body));
    } else {
      print("Server did not respond: Status code: ${response.statusCode}");

      throw Exception('Failed to load Match');
    }
  }
}
