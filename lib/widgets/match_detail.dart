import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostrates_sports/controllers/http_controller.dart';
import 'package:mostrates_sports/controllers/selection_controller.dart';
import 'package:mostrates_sports/models/event.dart';
import 'package:mostrates_sports/pages/game_detail.dart';

import '../constants/style.dart';
import '../models/match.dart';

class MatchDetail extends StatefulWidget {
  EventsList event;
  int index;

  MatchDetail({Key? key, required this.event, required this.index})
      : super(key: key);

  @override
  State<MatchDetail> createState() => _MatchDetailState();
}

class _MatchDetailState extends State<MatchDetail> {
  late Future<Match> _futureMatch;
  SelectionController _selectionController = Get.find<SelectionController>();

  @override
  void initState() {
    _futureMatch = HttpController().getMatch(widget.event.gameId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String op1Logo = widget.event.opp1Icon.toString();
    String op2Logo = widget.event.opp2Icon.toString();
    String time = widget.event.timer.toString();
    String home = _selectionController.eventOP[widget.index]['home'];
    String away = _selectionController.eventOP[widget.index]['away'];
    ;
    String draw = _selectionController.eventOP[widget.index]['draw'];
    ;
    String op1En = widget.event.opp1NameEn.toString();
    String op2En = widget.event.opp2NameEn.toString();
    String gameId = widget.event.gameId.toString();
    String scoreFull = widget.event.scoreFull.toString();
    return InkWell(
      onTap: () {
        Get.to(
          () => GameDetail(
            op1Logo: op1Logo,
            op2Logo: op2Logo,
            op1En: op1En,
            op2En: op2En,
            time: time,
            home: home,
            away: away,
            draw: draw,
            gameId: gameId,
            scoreFull: scoreFull,
          ),
        );
      },
      child: Column(
        children: [
          Divider(
            color: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.event.opp1NameEn.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.event.opp2NameEn.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder<Match>(
                      future: _futureMatch,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: appColor,
                                  height: 30,
                                  width: 60,
                                  child: Center(
                                      child: Text(
                                    snapshot.data!.body!.gameOcList!.isEmpty
                                        ? "N/A"
                                        : snapshot.data!.body!.gameOcList!
                                            .where((element) =>
                                                element.ocName ==
                                                widget.event.opp1NameEn)
                                            .single
                                            .ocRate
                                            .toString(),
                                    style: const TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, top: 8.0, bottom: 8.0),
                                child: Container(
                                  color: appColor,
                                  height: 30,
                                  width: 60,
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.body!.gameOcList!.isEmpty
                                          ? "N/A"
                                          : snapshot.data!.body!.gameOcList!
                                              .where((element) =>
                                                  element.ocName ==
                                                  widget.event.opp2NameEn)
                                              .first
                                              .ocRate
                                              .toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: appColor,
                                  height: 30,
                                  width: 60,
                                  child: Center(
                                      child: Text(
                                    home,
                                    style: const TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, top: 8.0, bottom: 8.0),
                                child: Container(
                                  color: appColor,
                                  height: 30,
                                  width: 60,
                                  child: Center(
                                    child: Text(
                                      away,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
