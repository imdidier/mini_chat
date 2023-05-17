import 'package:mini_chat/domain/entities/message.dart';

class YesNoModel {
  final String anwers;
  final bool forced;
  final String image;

  YesNoModel({
    required this.anwers,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        anwers: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "anwers": anwers,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
        text: anwers == 'yes' ? 'Si' : 'No',
        fromWho: FromWho.hers,
        imageUrl: image,
      );
}
