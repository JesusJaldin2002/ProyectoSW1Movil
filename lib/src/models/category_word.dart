// To parse this JSON data, do
//
//     final categoryWord = categoryWordFromJson(jsonString);

import 'dart:convert';

CategoryWord categoryWordFromJson(String str) => CategoryWord.fromJson(json.decode(str));

String categoryWordToJson(CategoryWord data) => json.encode(data.toJson());

class CategoryWord {
    List<Category> categories;

    CategoryWord({
        required this.categories,
    });

    factory CategoryWord.fromJson(Map<String, dynamic> json) => CategoryWord(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    int id;
    String name;
    List<Word> words;

    Category({
        required this.id,
        required this.name,
        required this.words,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        words: List<Word>.from(json["words"].map((x) => Word.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "words": List<dynamic>.from(words.map((x) => x.toJson())),
    };
}

class Word {
    int id;
    String name;
    String gifPath;

    Word({
        required this.id,
        required this.name,
        required this.gifPath,
    });

    factory Word.fromJson(Map<String, dynamic> json) => Word(
        id: json["id"],
        name: json["name"],
        gifPath: json["gif_path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gif_path": gifPath,
    };
}
