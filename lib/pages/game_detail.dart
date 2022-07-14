import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostrates_sports/constants/style.dart';
import 'package:mostrates_sports/controllers/http_controller.dart';
import 'package:mostrates_sports/controllers/selection_controller.dart';

import '../models/match.dart';

class GameDetail extends StatefulWidget {
  String? op1Logo;
  String? op2Logo;
  String? op1En;
  String? op2En;
  String? time;
  String? home;
  String? away;
  String? draw;
  String? gameId;
  String? scoreFull;
  GameDetail(
      {Key? key,
      required this.op1Logo,
      required this.op2Logo,
      required this.op1En,
      required this.op2En,
      required this.time,
      required this.away,
      required this.draw,
      required this.home,
      required this.gameId,
      required this.scoreFull})
      : super(key: key);

  @override
  State<GameDetail> createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetail> {
  late Future<Match> _futureMatch;
  SelectionController _selectionController = Get.find<SelectionController>();

  @override
  void initState() {
    _futureMatch = HttpController().getMatch(widget.gameId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _boxSize = MediaQuery.of(context).size.height * 0.06;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_selectionController.selectedSportName.value),
        leading: Padding(
          padding: EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 30, right: 30, left: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: _boxSize,
                      width: _boxSize,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.network(
                            "https://cdn.incub.space/v1/opp/icon/" +
                                widget.op1Logo.toString() +
                                ".png"),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        //shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(_boxSize),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: _boxSize * 2,
                        child: Center(
                          child: Text(
                            widget.op1En.toString(),
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.scoreFull.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: appColor,
                      fontSize: 16),
                ),
                Column(
                  children: [
                    Container(
                      height: _boxSize,
                      width: _boxSize,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.network(
                            "https://cdn.incub.space/v1/opp/icon/" +
                                widget.op2Logo.toString() +
                                ".png"),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        //shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(_boxSize),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: _boxSize * 2,
                        child: Center(
                          child: Text(
                            widget.op2En.toString(),
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black.withOpacity(0.5),
          ),
          SizedBox(
            height: _boxSize / 2,
          ),
          Padding(
            padding: EdgeInsets.only(left: _boxSize, right: _boxSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: appColor,
                  height: 30,
                  width: 60,
                  child: Center(
                      child: Text(
                    widget.home.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                Container(
                  color: appColor,
                  height: 30,
                  width: 60,
                  child: Center(
                    child: Text(
                      widget.draw.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: appColor,
                  height: 30,
                  width: 60,
                  child: Center(
                    child: Text(
                      widget.away.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: _boxSize / 2,
          ),
          Divider(
            color: Colors.black.withOpacity(0.5),
          ),
          const Spacer(),
          Center(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Back to events',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: _boxSize * 2,
          ),
        ],
      ),
    );
  }
}
