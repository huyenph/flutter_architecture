class QuestionOwner {
  int reputation;
  int userId;
  String userType;
  String profileImage;
  String displayName;
  String link;
  int acceptRate;

  QuestionOwner({
    this.reputation,
    this.userId,
    this.userType,
    this.profileImage,
    this.displayName,
    this.link,
    this.acceptRate,
  });

  factory QuestionOwner.fromJson(Map<String, dynamic> json) => QuestionOwner(
        reputation: json["reputation"],
        userId: json["user_id"],
        userType: json["user_type"],
        profileImage: json["profile_image"],
        displayName: json["display_name"],
        link: json["link"],
        acceptRate: json["accept_rate"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "reputation": reputation,
        "user_id": userId,
        "user_type": userType,
        "profile_image": profileImage,
        "display_name": displayName,
        "link": link,
        "accept_rate": acceptRate ?? null,
      };
}
