class HotelModel {
  List<Data>? data;


  HotelModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }

  }

}

class Data {
  String? hotelId;
  String? name;
  String? currency;
  int? starRating;
  Description? description;
  List<String>? phoneNumbers;
  bool? contractable;
  List<Images>? images;
  Location? location;
  String? timezone;
  int? roomCount;
  CheckIn? checkIn;
  CheckOut? checkOut;
  String? createdAt;
  String? updatedAt;


  Data.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotelId'];
    name = json['name'];
    currency = json['currency'];
    starRating = json['starRating'];
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    phoneNumbers = json['phoneNumbers'].cast<String>();
    contractable = json['contractable'];


    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }

    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    timezone = json['timezone'];
    if (json['amenities'] != null) {

    }
    roomCount = json['roomCount'];
    checkIn =
    json['checkIn'] != null ? new CheckIn.fromJson(json['checkIn']) : null;
    checkOut = json['checkOut'] != null
        ? new CheckOut.fromJson(json['checkOut'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

  }

}

class Description {
  String? short;

  Description({this.short});

  Description.fromJson(Map<String, dynamic> json) {
    short = json['short'];
  }

}

class Images {


  String? url;



  Images.fromJson(Map<String, dynamic> json) {

    url = json['url'];

  }

}

class Address {
  String? line1;
  Null? line2;
  String? city;
  String? postalCode;
  String? region;
  String? country;
  String? countryName;

  Address.fromJson(Map<String, dynamic> json) {
    line1 = json['line1'];
    line2 = json['line2'];
    city = json['city'];
    postalCode = json['postalCode'];
    region = json['region'];
    country = json['country'];
    countryName = json['countryName'];
  }

}

class Location {
  double? longitude;
  double? latitude;

  Location({this.longitude, this.latitude});

  Location.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }


}

class Amenities {
  int? code;
  String? formatted;

  Amenities({this.code, this.formatted});

  Amenities.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    formatted = json['formatted'];
  }

}

class CheckIn {
  String? from;

  CheckIn({this.from});

  CheckIn.fromJson(Map<String, dynamic> json) {
    from = json['from'];
  }

}

class CheckOut {
  String? to;


  CheckOut.fromJson(Map<String, dynamic> json) {
    to = json['to'];
  }

}

class RoomTypes {
  String? roomTypeId;
  String? name;
  String? description;
  int? maxOccupancy;
  List<Rates>? rates;
  List<Amenities>? amenities;
  List<Images>? images;


  RoomTypes.fromJson(Map<String, dynamic> json) {
    roomTypeId = json['roomTypeId'];
    name = json['name'];
    description = json['description'];
    maxOccupancy = json['maxOccupancy'];
    if (json['rates'] != null) {
      rates = <Rates>[];
      json['rates'].forEach((v) {
        rates!.add(new Rates.fromJson(v));
      });
    }
    if (json['amenities'] != null) {
      amenities = <Amenities>[];
      json['amenities'].forEach((v) {
        amenities!.add(new Amenities.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

}

class Rates {
  String? rateId;
  String? start;
  String? end;
  int? maxOccupancy;
  int? roomsSellable;
  Null? hotelAgreement;
  RetailRate? retailRate;
  Total? sellerToImpalaPayment;
  int? sellerCommissionPercentage;
  List<Components>? components;
  List<CancellationPolicies>? cancellationPolicies;


  Rates.fromJson(Map<String, dynamic> json) {
    rateId = json['rateId'];
    start = json['start'];
    end = json['end'];
    maxOccupancy = json['maxOccupancy'];
    roomsSellable = json['roomsSellable'];
    hotelAgreement = json['hotelAgreement'];
    retailRate = json['retailRate'] != null
        ? new RetailRate.fromJson(json['retailRate'])
        : null;
    sellerToImpalaPayment = json['sellerToImpalaPayment'] != null
        ? new Total.fromJson(json['sellerToImpalaPayment'])
        : null;
    sellerCommissionPercentage = json['sellerCommissionPercentage'];
    if (json['components'] != null) {
      components = <Components>[];
      json['components'].forEach((v) {
        components!.add(new Components.fromJson(v));
      });
    }
    if (json['cancellationPolicies'] != null) {
      cancellationPolicies = <CancellationPolicies>[];
      json['cancellationPolicies'].forEach((v) {
        cancellationPolicies!.add(new CancellationPolicies.fromJson(v));
      });
    }
  }

}

class RetailRate {
  Total? total;



  RetailRate.fromJson(Map<String, dynamic> json) {
    total = json['total'] != null ? new Total.fromJson(json['total']) : null;

  }

}

class Total {
  int? amount;
  Currency? currency;

  Total({this.amount, this.currency});

  Total.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
  }

}

class Currency {
  String? code;


  Currency.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

}


class Components {
  String? formatted;
  String? type;
  bool? includedInRate;

  Components({this.formatted, this.type, this.includedInRate});

  Components.fromJson(Map<String, dynamic> json) {
    formatted = json['formatted'];
    type = json['type'];
    includedInRate = json['includedInRate'];
  }

}

class CancellationPolicies {
  String? formatted;
  String? start;
  String? end;
  Fee? fee;



  CancellationPolicies.fromJson(Map<String, dynamic> json) {
    formatted = json['formatted'];
    start = json['start'];
    end = json['end'];
    fee = json['fee'] != null ? new Fee.fromJson(json['fee']) : null;
  }

}

class Fee {
  String? type;
  Total? price;
  int? count;

  Fee({this.type, this.price, this.count});

  Fee.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'] != null ? new Total.fromJson(json['price']) : null;
    count = json['count'];
  }


}
