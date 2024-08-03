class userDB {
  final int? id;
  String? NameAndSurname;
  String? PhoneNumber;
  String? Email;
  String? selectedContainerType;
  int? weight;
  String? selectedDestination;
  int? distance;
  int? basePriceByWeight;
  int? priceByDistance;
  int? totalPrice;

  userDB({
      this.id,
      this.NameAndSurname,
      this.PhoneNumber,
      this.Email,
      this.selectedContainerType,
      this.weight,
      this.selectedDestination,
      this.distance,
      this.basePriceByWeight,
      this.priceByDistance,
      this.totalPrice});

  userDB.fromMap(Map<String, dynamic> item)
      : id = item['id'],
        NameAndSurname = item['NameAndSurname'],
        PhoneNumber = item['PhoneNumber'],
        Email = item['Email'],
        selectedContainerType = item['selectedContainerType'],
        weight = item['weight'],
        selectedDestination = item['selectedDestination'],
        distance = item['distance'],
        basePriceByWeight = item['basePriceByWeight'],
        priceByDistance = item['priceByDistance'],
        totalPrice = item['totalPrice'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'NameAndSurname': NameAndSurname,
      'PhoneNumber': PhoneNumber,
      'Email': Email,
      'selectedContainerType': selectedContainerType,
      'weight': weight,
      'selectedDestination': selectedDestination,
      'distance': distance,
      'basePriceByWeight': basePriceByWeight,
      'priceByDistance': priceByDistance,
      'totalPrice': totalPrice,
    };
  }
}