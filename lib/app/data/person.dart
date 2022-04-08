// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

import 'dart:math';

Result personFromJson(String str) => Result.fromJson(json.decode(str));

String personToJson(Result data) => json.encode(data.toJson());

class Result {
  Result({
    this.persons,
    this.info,
  });

  List<Person>? persons;
  Info? info;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        persons: json["results"] == null
            ? null
            : List<Person>.from(json["results"].map((x) => Person.fromJson(x))),
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "results": persons == null
            ? null
            : List<dynamic>.from(persons!.map((x) => x.toJson())),
        "info": info == null ? null : info!.toJson(),
      };
}

class Info {
  Info({
    this.seed,
    this.results,
    this.page,
    this.version,
  });

  String? seed;
  int? results;
  int? page;
  String? version;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
      };
}

class Person {
  Person({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  String? gender;
  Name? name;
  Location? location;
  String? email;
  Login? login;
  Dob? dob;
  Dob? registered;
  String? phone;
  String? cell;
  Id? id;
  Picture? picture;
  String? nat;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        gender: json["gender"],
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        email: json["email"],
        login: json["login"] == null ? null : Login.fromJson(json["login"]),
        dob: json["dob"] == null ? null : Dob.fromJson(json["dob"]),
        registered: json["registered"] == null
            ? null
            : Dob.fromJson(json["registered"]),
        phone: json["phone"],
        cell: json["cell"],
        id: json["id"] == null ? null : Id.fromJson(json["id"]),
        picture:
            json["picture"] == null ? null : Picture.fromJson(json["picture"]),
        nat: json["nat"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name == null ? null : name!.toJson(),
        "location": location == null ? null : location!.toJson(),
        "email": email,
        "login": login == null ? null : login!.toJson(),
        "dob": dob == null ? null : dob!.toJson(),
        "registered": registered == null ? null : registered!.toJson(),
        "phone": phone,
        "cell": cell,
        "id": id == null ? null : id!.toJson(),
        "picture": picture == null ? null : picture!.toJson(),
        "nat": nat,
      };
}

class Dob {
  Dob({
    this.date,
  });

  DateTime? date;

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date == null ? null : date!.toIso8601String(),
      };

  num get age => date == null
      ? 0
      : DateTime.now().difference(date!).inHours ~/
          (const Duration(days: 365).inHours);
}

class Id {
  Id({
    this.name,
    this.value,
  });

  String? name;
  dynamic value;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Location {
  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.coordinates,
    this.timezone,
  });

  Street? street;
  String? city;
  String? state;
  String? country;
  Coordinates? coordinates;
  Timezone? timezone;

  /// Get Full Information about location
  String get fullLocation => '${street?.number} ${street?.name}, $city, $state';

  /// Calculate distance to current location, for sample, I just fix current location to some where.
  int distanceTo({
    Coordinates? yourCoordinates,
  }) {
    if (coordinates == null) return 0;
    return _calculateDistance(
      yourCoordinates?.latitude ?? 21.0244247,
      yourCoordinates?.longitude ?? 105.7938073,
      double.parse(coordinates!.latitude!),
      double.parse(coordinates!.longitude!),
    ).round();
  }

  double _calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: json["street"] == null ? null : Street.fromJson(json["street"]),
        city: json["city"],
        state: json["state"],
        country: json["country"],
        coordinates: json["coordinates"] == null
            ? null
            : Coordinates.fromJson(json["coordinates"]),
        timezone: json["timezone"] == null
            ? null
            : Timezone.fromJson(json["timezone"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street == null ? null : street!.toJson(),
        "city": city,
        "state": state,
        "country": country,
        "coordinates": coordinates == null ? null : coordinates!.toJson(),
        "timezone": timezone == null ? null : timezone!.toJson(),
      };
}

class Coordinates {
  Coordinates({
    this.latitude,
    this.longitude,
  });

  String? latitude;
  String? longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Street {
  Street({
    this.number,
    this.name,
  });

  int? number;
  String? name;

  factory Street.fromJson(Map<String, dynamic> json) => Street(
        number: json["number"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
      };
}

class Timezone {
  Timezone({
    this.offset,
    this.description,
  });

  String? offset;
  String? description;

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        offset: json["offset"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "description": description,
      };
}

class Login {
  Login({
    this.uuid,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  });

  String? uuid;
  String? username;
  String? password;
  String? salt;
  String? md5;
  String? sha1;
  String? sha256;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        salt: json["salt"],
        md5: json["md5"],
        sha1: json["sha1"],
        sha256: json["sha256"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "salt": salt,
        "md5": md5,
        "sha1": sha1,
        "sha256": sha256,
      };
}

class Name {
  Name({
    this.title,
    this.first,
    this.last,
  });

  String? title;
  String? first;
  String? last;

  String get fullName => '$title $first $last';

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  String? large;
  String? medium;
  String? thumbnail;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
