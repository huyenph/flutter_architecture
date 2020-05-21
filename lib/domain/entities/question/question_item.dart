import 'package:flutterarchitecture/domain/entities/question/question_owner.dart';

class QuestionItem {
  QuestionOwner owner;
  int score;
  int lastEditDate;
  int lastActivityDate;
  int creationDate;
  String postType;
  int postId;
  String contentLicense;
  String link;

  QuestionItem({
    this.owner,
    this.score,
    this.lastEditDate,
    this.lastActivityDate,
    this.creationDate,
    this.postType,
    this.postId,
    this.contentLicense,
    this.link,
  });

  factory QuestionItem.fromJson(Map<String, dynamic> json) => QuestionItem(
        owner: QuestionOwner.fromJson(json["owner"]),
        score: json["score"],
        lastEditDate: json["last_edit_date"] ?? null,
        lastActivityDate: json["last_activity_date"],
        creationDate: json["creation_date"],
        postType: json["post_type"],
        postId: json["post_id"],
        contentLicense: json["content_license"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "owner": owner.toJson(),
        "score": score,
        "last_edit_date": lastEditDate ?? null,
        "last_activity_date": lastActivityDate,
        "creation_date": creationDate,
        "post_type": postType,
        "post_id": postId,
        "content_license": contentLicense,
        "link": link,
      };
}
