class Responses {
  final bool? status;
  final String? message;

  final dynamic data;
  Responses({this.status, this.message, this.data});

  factory Responses.fromJson(Map<String, dynamic> json) {
    return Responses(
        status: json['status'] ?? (json['code'] == 200),
        message: json['message'],
        data: json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;

    return data;
  }
}
