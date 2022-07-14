class Category {
  int? id;
  String? name;
  String? nameEn;
  int? counter;

  Category({this.id, this.name, this.nameEn, this.counter});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    counter = json['counter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_en'] = nameEn;
    data['counter'] = counter;
    return data;
  }
}
