class Login {
  String token;

  Login({this.token});

  factory Login.fromJson(Map<String, dynamic> json) {
    if (json['token'] != null) {
      return Login(token: json['token']);
    } else {
      return Login(token: null);
    }
  }
}
