class ResponsePost {
  bool success;
  String message;
  ResponsePost({required this.success,required this.message});
  factory ResponsePost.fromJson(Map<String, dynamic> json) =>
      ResponsePost(
          success: json["success"],
          message: json["message"],
          );
  Map<String, dynamic> toJson() =>{"success": success, "message": message};
}