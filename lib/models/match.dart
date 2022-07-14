class Match {
  int? status;
  String? page;
  Body? body;

  Match({this.status, this.page, this.body});

  Match.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    page = json['page'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['page'] = this.page;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class Body {
  String? uniq;
  String? chainId;
  int? extGameId;
  int? gameId;
  int? gameMid;
  int? gameNum;
  String? gameDopName;
  int? gameStart;
  List<GameOcList>? gameOcList;
  int? tournamentId;
  String? tournamentName;
  String? tournamentNameRu;
  String? tournamentNameEn;
  String? opp1Name;
  String? opp2Name;
  String? opp1NameRu;
  String? opp2NameRu;
  String? opp1NameEn;
  String? opp2NameEn;
  int? opp1Id;
  List<int>? opp1Ids;
  int? opp2Id;
  List<int>? opp2Ids;
  int? opp1Icon;
  int? opp2Icon;
  String? sportName;
  String? sportNameRu;
  String? sportNameEn;
  int? sportId;
  String? scoreFull;
  String? scoreExtra;
  String? scorePeriod;
  String? periodName;
  int? timer;
  String? extraTime;
  String? gamePlan;
  bool? finale;
  String? gameDesk;

  Body({
    this.uniq,
    this.chainId,
    this.extGameId,
    this.gameId,
    this.gameMid,
    this.gameNum,
    this.gameDopName,
    this.gameStart,
    this.gameOcList,
    this.tournamentId,
    this.tournamentName,
    this.tournamentNameRu,
    this.tournamentNameEn,
    this.opp1Name,
    this.opp2Name,
    this.opp1NameRu,
    this.opp2NameRu,
    this.opp1NameEn,
    this.opp2NameEn,
    this.opp1Id,
    this.opp1Ids,
    this.opp2Id,
    this.opp2Ids,
    this.opp1Icon,
    this.opp2Icon,
    this.sportName,
    this.sportNameRu,
    this.sportNameEn,
    this.sportId,
    this.scoreFull,
    this.scoreExtra,
    this.scorePeriod,
    this.periodName,
    this.timer,
    this.extraTime,
    this.gamePlan,
    this.finale,
    this.gameDesk,
  });

  Body.fromJson(Map<String, dynamic> json) {
    uniq = json['uniq'];
    chainId = json['chain_id'];
    extGameId = json['ext_game_id'];
    gameId = json['game_id'];
    gameMid = json['game_mid'];
    gameNum = json['game_num'];
    gameDopName = json['game_dop_name'];
    gameStart = json['game_start'];
    if (json['game_oc_list'] != null) {
      gameOcList = <GameOcList>[];
      json['game_oc_list'].forEach((v) {
        gameOcList!.add(new GameOcList.fromJson(v));
      });
    }
    tournamentId = json['tournament_id'];
    tournamentName = json['tournament_name'];
    tournamentNameRu = json['tournament_name_ru'];
    tournamentNameEn = json['tournament_name_en'];
    opp1Name = json['opp_1_name'];
    opp2Name = json['opp_2_name'];
    opp1NameRu = json['opp_1_name_ru'];
    opp2NameRu = json['opp_2_name_ru'];
    opp1NameEn = json['opp_1_name_en'];
    opp2NameEn = json['opp_2_name_en'];
    opp1Id = json['opp_1_id'];
    opp1Ids = json['opp_1_ids'].cast<int>();
    opp2Id = json['opp_2_id'];
    opp2Ids = json['opp_2_ids'].cast<int>();
    opp1Icon = json['opp_1_icon'];
    opp2Icon = json['opp_2_icon'];
    sportName = json['sport_name'];
    sportNameRu = json['sport_name_ru'];
    sportNameEn = json['sport_name_en'];
    sportId = json['sport_id'];
    scoreFull = json['score_full'];
    scoreExtra = json['score_extra'];
    scorePeriod = json['score_period'];
    periodName = json['period_name'];
    timer = json['timer'];
    extraTime = json['extra_time'];
    gamePlan = json['game_plan'];
    finale = json['finale'];
    gameDesk = json['game_desk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uniq'] = this.uniq;
    data['chain_id'] = this.chainId;
    data['ext_game_id'] = this.extGameId;
    data['game_id'] = this.gameId;
    data['game_mid'] = this.gameMid;
    data['game_num'] = this.gameNum;
    data['game_dop_name'] = this.gameDopName;
    data['game_start'] = this.gameStart;
    if (this.gameOcList != null) {
      data['game_oc_list'] = this.gameOcList!.map((v) => v.toJson()).toList();
    }
    data['tournament_id'] = this.tournamentId;
    data['tournament_name'] = this.tournamentName;
    data['tournament_name_ru'] = this.tournamentNameRu;
    data['tournament_name_en'] = this.tournamentNameEn;
    data['opp_1_name'] = this.opp1Name;
    data['opp_2_name'] = this.opp2Name;
    data['opp_1_name_ru'] = this.opp1NameRu;
    data['opp_2_name_ru'] = this.opp2NameRu;
    data['opp_1_name_en'] = this.opp1NameEn;
    data['opp_2_name_en'] = this.opp2NameEn;
    data['opp_1_id'] = this.opp1Id;
    data['opp_1_ids'] = this.opp1Ids;
    data['opp_2_id'] = this.opp2Id;
    data['opp_2_ids'] = this.opp2Ids;
    data['opp_1_icon'] = this.opp1Icon;
    data['opp_2_icon'] = this.opp2Icon;
    data['sport_name'] = this.sportName;
    data['sport_name_ru'] = this.sportNameRu;
    data['sport_name_en'] = this.sportNameEn;
    data['sport_id'] = this.sportId;
    data['score_full'] = this.scoreFull;
    data['score_extra'] = this.scoreExtra;
    data['score_period'] = this.scorePeriod;
    data['period_name'] = this.periodName;
    data['timer'] = this.timer;
    data['extra_time'] = this.extraTime;
    data['game_plan'] = this.gamePlan;
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
  int? columns;

  GameOcList(
      {this.ocGroupName,
      this.ocName,
      this.ocRate,
      this.ocPointer,
      this.ocBlock,
      this.columns});

  GameOcList.fromJson(Map<String, dynamic> json) {
    ocGroupName = json['oc_group_name'];
    ocName = json['oc_name'];
    ocRate = json['oc_rate'];
    ocPointer = json['oc_pointer'];
    ocBlock = json['oc_block'];
    columns = json['columns'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oc_group_name'] = this.ocGroupName;
    data['oc_name'] = this.ocName;
    data['oc_rate'] = this.ocRate;
    data['oc_pointer'] = this.ocPointer;
    data['oc_block'] = this.ocBlock;
    data['columns'] = this.columns;
    return data;
  }
}
