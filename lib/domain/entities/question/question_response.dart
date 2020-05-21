import 'package:flutterarchitecture/domain/entities/question/question_item.dart';

class QuestionResponse {
  List<QuestionItem> items;
  bool hasMore;
  int backoff;
  int quotaMax;
  int quotaRemaining;

  QuestionResponse({
    this.items,
    this.hasMore,
    this.backoff,
    this.quotaMax,
    this.quotaRemaining,
  });

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      QuestionResponse(
        items: List<QuestionItem>.from(
          json["items"].map(
            (x) => QuestionItem.fromJson(x),
          ),
        ),
        hasMore: json["has_more"],
        backoff: json["backoff"],
        quotaMax: json["quota_max"],
        quotaRemaining: json["quota_remaining"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(
          items.map(
            (x) => x.toJson(),
          ),
        ),
        "has_more": hasMore,
        "backoff": backoff,
        "quota_max": quotaMax,
        "quota_remaining": quotaRemaining,
      };
}
