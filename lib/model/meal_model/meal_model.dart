import 'dart:convert';

class MealModel {
  String message;
  List<Meal> meals;

  MealModel({
    required this.message,
    required this.meals,
  });

  factory MealModel.fromRawJson(String str) =>
      MealModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        message: json["message"],
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };

  @override
  String toString() => 'MealModel(message: $message, meals: $meals)';
}

class Meal {
  String id;
  String name;
  String description;
  int price;
  String howToSell;
  List<String> images;
  String category;
  String chefId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Meal({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.howToSell,
    required this.images,
    required this.category,
    required this.chefId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Meal.fromRawJson(String str) => Meal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        howToSell: json["howToSell"],
        images: List<String>.from(json["images"].map((x) => x)),
        category: json["category"],
        chefId: json["chefId"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "price": price,
        "howToSell": howToSell,
        "images": List<dynamic>.from(images.map((x) => x)),
        "category": category,
        "chefId": chefId,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };

  @override
  String toString() {
    return 'Meal(id: $id, name: $name, description: $description, price: $price, howToSell: $howToSell, images: $images, category: $category, chefId: $chefId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }
}
