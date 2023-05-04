// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
  List<FirstModel>? firstModel;
  List<SecondModel>? secondModel;

  User({
    this.firstModel,
    this.secondModel,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        firstModel: json["firstModel"] == null
            ? []
            : List<FirstModel>.from(
                json["firstModel"]!.map((x) => FirstModel.fromMap(x))),
        secondModel: json["secondModel"] == null
            ? []
            : List<SecondModel>.from(
                json["secondModel"]!.map((x) => SecondModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "firstModel": firstModel == null
            ? []
            : List<dynamic>.from(firstModel!.map((x) => x.toMap())),
        "secondModel": secondModel == null
            ? []
            : List<dynamic>.from(secondModel!.map((x) => x.toMap())),
      };
}

class FirstModel {
  String? image;
  String? name;

  FirstModel({
    this.image,
    this.name,
  });

  factory FirstModel.fromMap(Map<String, dynamic> json) => FirstModel(
        image: json["image"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "image": image,
        "name": name,
      };
}

class SecondModel {
  String? image;
  String? nameText;
  String? price;

  SecondModel({
    this.image,
    this.nameText,
    this.price,
  });

  factory SecondModel.fromMap(Map<String, dynamic> json) => SecondModel(
        image: json["image"],
        nameText: json["nameText"],
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "image": image,
        "nameText": nameText,
        "price": price,
      };
}
