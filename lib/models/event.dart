class Event {
  int? status;
  String? page;
  List<Body>? body;

  Event({this.status, this.page, this.body});

  Event.fromJson(Map<String, dynamic> json) {
    print("Br1");
    status = json['status'];
    page = json['page'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['page'] = this.page;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Body {
  int? tournamentId;
  String? tournamentName;
  List<EventsList>? eventsList;

  Body({this.tournamentId, this.tournamentName, this.eventsList});

  Body.fromJson(Map<String, dynamic> json) {
    tournamentId = json['tournament_id'];
    tournamentName = json['tournament_name'];
    if (json['events_list'] != null) {
      eventsList = <EventsList>[];
      json['events_list'].forEach((v) {
        eventsList!.add(new EventsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tournament_id'] = this.tournamentId;
    data['tournament_name'] = this.tournamentName;
    if (this.eventsList != null) {
      data['events_list'] = this.eventsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventsList {
  String? uniq;
  int? gameId;
  int? gameStart;
  //List<GameOcList>? gameOcList;
  int? gameOcCounter;
  int? countryId;
  String? countryName;
  int? tournamentId;
  String? tournamentName;
  String? tournamentNameRu;
  String? tournamentNameEn;
  String? opp1NameEn;
  String? opp2NameEn;
  int? opp1Id;
  int? opp2Id;
  int? opp1Icon;
  int? opp2Icon;
  String? sportNameEn;
  int? sportId;
  String? scoreFull;
  String? scoreExtra;
  String? scorePeriod;
  String? periodName;
  int? timer;
  String? extraTime;
  bool? finale;
  String? gameDesk;

  EventsList(
      {this.uniq,
      this.gameId,
      this.gameStart,
      //this.gameOcList,
      this.gameOcCounter,
      this.countryId,
      this.countryName,
      this.tournamentId,
      this.tournamentName,
      this.tournamentNameRu,
      this.tournamentNameEn,
      this.opp1NameEn,
      this.opp2NameEn,
      this.opp1Id,
      this.opp2Id,
      this.opp1Icon,
      this.opp2Icon,
      this.sportNameEn,
      this.sportId,
      this.scoreFull,
      this.scoreExtra,
      this.scorePeriod,
      this.periodName,
      this.timer,
      this.extraTime,
      this.finale,
      this.gameDesk});

  EventsList.fromJson(Map<String, dynamic> json) {
    uniq = json['uniq'];
    gameId = json['game_id'];
    gameStart = json['game_start'];
    /*if (json['game_oc_list'] != null) {
      gameOcList = <GameOcList>[];
      json['game_oc_list'].forEach((v) {
        gameOcList!.add(new GameOcList.fromJson(v));
      });
    }*/
    gameOcCounter = json['game_oc_counter'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    tournamentId = json['tournament_id'];
    tournamentName = json['tournament_name'];
    tournamentNameRu = json['tournament_name_ru'];
    tournamentNameEn = json['tournament_name_en'];
    opp1NameEn = json['opp_1_name_en'];
    opp2NameEn = json['opp_2_name_en'];
    opp1Id = json['opp_1_id'];

    opp2Id = json['opp_2_id'];

    opp1Icon = json['opp_1_icon'];
    opp2Icon = json['opp_2_icon'];
    sportNameEn = json['sport_name_en'];
    sportId = json['sport_id'];
    scoreFull = json['score_full'];
    scoreExtra = json['score_extra'];
    scorePeriod = json['score_period'];
    periodName = json['period_name'];
    timer = json['timer'];
    extraTime = json['extra_time'];
    finale = json['finale'];
    gameDesk = json['game_desk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uniq'] = this.uniq;

    data['game_id'] = this.gameId;
    data['game_start'] = this.gameStart;
    /*if (this.gameOcList != null) {
      data['game_oc_list'] = this.gameOcList!.map((v) => v.toJson()).toList();
    }*/
    data['game_oc_counter'] = this.gameOcCounter;
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['tournament_id'] = this.tournamentId;
    data['tournament_name'] = this.tournamentName;
    data['tournament_name_ru'] = this.tournamentNameRu;
    data['tournament_name_en'] = this.tournamentNameEn;
    data['opp_1_name_en'] = this.opp1NameEn;
    data['opp_2_name_en'] = this.opp2NameEn;
    data['opp_1_id'] = this.opp1Id;
    data['opp_2_id'] = this.opp2Id;
    data['opp_1_icon'] = this.opp1Icon;
    data['opp_2_icon'] = this.opp2Icon;
    data['sport_name_en'] = this.sportNameEn;
    data['sport_id'] = this.sportId;
    data['score_full'] = this.scoreFull;
    data['score_extra'] = this.scoreExtra;
    data['score_period'] = this.scorePeriod;
    data['period_name'] = this.periodName;

    data['timer'] = this.timer;
    data['extra_time'] = this.extraTime;
    data['finale'] = this.finale;
    data['game_desk'] = this.gameDesk;
    return data;
  }
}

class GameOcList {
  String? ocGroupName;
  String? ocName;
  double? ocRate;
  String? ocPointer;
  bool? ocBlock;

  GameOcList(
      {this.ocGroupName,
      this.ocName,
      this.ocRate,
      this.ocPointer,
      this.ocBlock});

  GameOcList.fromJson(Map<String, dynamic> json) {
    print("Br2");
    ocGroupName = json['oc_group_name'];
    ocName = json['oc_name'];
    ocRate = json['oc_rate'];
    ocPointer = json['oc_pointer'];
    ocBlock = json['oc_block'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oc_group_name'] = this.ocGroupName;
    data['oc_name'] = this.ocName;
    data['oc_rate'] = this.ocRate;
    data['oc_pointer'] = this.ocPointer;
    data['oc_block'] = this.ocBlock;
    return data;
  }
}
