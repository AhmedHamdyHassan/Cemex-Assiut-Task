class TruckModel {
  int? truckId;
  String? truckName;
  String? truckNumber;
  String? truckCompany;
  int? truckYear;
  String? status;
  String? manufacturer;
  String? type;
  String? size;
  String? unit;
  bool? active;
  String? chassis;
  String? engine;
  String? registeration;
  int? axleCount;
  String? vehichleModelNo;
  String? image;
  String? category;

  TruckModel(
      {this.truckId,
      this.truckName,
      this.truckNumber,
      this.truckCompany,
      this.truckYear,
      this.status,
      this.manufacturer,
      this.type,
      this.size,
      this.unit,
      this.active,
      this.chassis,
      this.engine,
      this.registeration,
      this.axleCount,
      this.vehichleModelNo,
      this.image,
      this.category});

  TruckModel.fromJson(Map<String, dynamic> json) {
    truckId = json['truckId'];
    truckName = json['truckName'];
    truckNumber = json['truckNumber'];
    truckCompany = json['truckCompany'];
    truckYear = json['truckYear'];
    status = json['status'];
    manufacturer = json['manufacturer'];
    type = json['type'];
    size = json['size'];
    unit = json['unit'];
    active = json['active'];
    chassis = json['chassis'];
    engine = json['engine'];
    registeration = json['registeration'];
    axleCount = json['axleCount'];
    vehichleModelNo = json['vehichleModelNo'];
    image = json['image'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['truckId'] = truckId;
    data['truckName'] = truckName;
    data['truckNumber'] = truckNumber;
    data['truckCompany'] = truckCompany;
    data['truckYear'] = truckYear;
    data['status'] = status;
    data['manufacturer'] = manufacturer;
    data['type'] = type;
    data['size'] = size;
    data['unit'] = unit;
    data['active'] = active;
    data['chassis'] = chassis;
    data['engine'] = engine;
    data['registeration'] = registeration;
    data['axleCount'] = axleCount;
    data['vehichleModelNo'] = vehichleModelNo;
    data['image'] = image;
    data['category'] = category;
    return data;
  }
}
