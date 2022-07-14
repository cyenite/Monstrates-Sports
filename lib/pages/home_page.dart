import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostrates_sports/controllers/http_controller.dart';
import 'package:mostrates_sports/controllers/selection_controller.dart';
import 'package:mostrates_sports/widgets/match_detail.dart';
import 'package:mostrates_sports/widgets/sport_detail.dart';

import '../constants/style.dart';
import '../models/category.dart';
import '../models/event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedEvent = "1";
  final ExpandableController _expandableController =
      ExpandableController(initialExpanded: false);
  late Future<List<Category>> _futureCategories;
  late Future<Event> _futureEvent;
  SelectionController _selectionController = Get.find<SelectionController>();

  @override
  void initState() {
    _futureCategories = HttpController().getCategories();
    _futureEvent = HttpController().getEvents(_selectedEvent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('EVENTS'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ExpandablePanel(
                  controller: _expandableController,
                  theme: const ExpandableThemeData(
                      hasIcon: false,
                      iconPlacement: ExpandablePanelIconPlacement.right,
                      iconColor: Colors.blueAccent,
                      expandIcon: Icons.arrow_forward_ios,
                      collapseIcon: Icons.keyboard_arrow_down,
                      headerAlignment: ExpandablePanelHeaderAlignment.center),
                  header: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _expandableController.value =
                                _expandableController.value ? false : true;
                          });
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() {
                                return Text(
                                  _selectionController.selectedSportName.value,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                  ),
                                );
                              }),
                              const SizedBox(
                                width: 10,
                              ),
                              _expandableController.value
                                  ? const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.blueAccent,
                                    )
                                  : const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.blueAccent,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  collapsed: const SizedBox.shrink(),
                  expanded: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: appColor,
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 20, bottom: 20),
                            child: Text(
                              "ALL SPORTS",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          color: const Color(0xFF2e5792),
                          height: MediaQuery.of(context).size.height,
                          child: FutureBuilder<List<Category>>(
                              future: _futureCategories,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                            onTap: () {
                                              setState(() {
                                                _expandableController.value =
                                                    false;
                                                _selectionController
                                                        .selectedEvent =
                                                    snapshot.data![index].id
                                                        .toString();
                                                _selectedEvent = snapshot
                                                    .data![index].id
                                                    .toString();
                                                _selectionController
                                                        .selectedSportName =
                                                    snapshot.data![index].name
                                                        .toString()
                                                        .obs;
                                                _futureEvent = HttpController()
                                                    .getEvents(_selectedEvent);
                                              });
                                            },
                                            child: SportDetail(
                                                category:
                                                    snapshot.data![index]));
                                      });
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: appColor,
                                    ),
                                  );
                                }
                              }),
                        ),
                      ],
                    ),
                  )),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder<Event>(
                    future: _futureEvent,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.body!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: snapshot
                                        .data!.body![index].eventsList!.length,
                                    itemBuilder: (context, index1) {
                                      return MatchDetail(
                                        index: index1 + index,
                                        event: snapshot.data!.body![index]
                                            .eventsList![index1],
                                      );
                                    }),
                              );
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: appColor,
                          ),
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
