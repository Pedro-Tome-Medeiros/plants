class Plant {
  int id;
  String name;
  String description;
  String? qrCode;

  Plant(this.id, this.name, this.description, this.qrCode);

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(json['id'], json['name'], json['description'], json['qrCode']);
  }
}
