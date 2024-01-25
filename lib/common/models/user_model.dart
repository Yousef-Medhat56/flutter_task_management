class TaskModel {
  final int id;
  final int isVerified;

  TaskModel({
    required this.id,
    required this.isVerified,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        isVerified: json["isVerified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isVerified": isVerified,
      };
}
