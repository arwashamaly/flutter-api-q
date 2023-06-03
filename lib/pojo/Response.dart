class Response {
  bool? status;
  String? message;
  List<Users>? data;

  Response({this.status, this.message, this.data});

  Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Users>[];
      json['data'].forEach((v) {
        data!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? bio;
  String? jobTitle;
  double? latitude;
  double? longitude;
  String? country;
  String? image;
  int? active;
  String? emailVerifiedAt;
  int? imagesCount;

  Users(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.mobile,
        this.bio,
        this.jobTitle,
        this.latitude,
        this.longitude,
        this.country,
        this.image,
        this.active,
        this.emailVerifiedAt,
        this.imagesCount});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    bio = json['bio'];
    jobTitle = json['job_title'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    country = json['country'];
    image = json['image'];
    active = json['active'];
    emailVerifiedAt = json['email_verified_at'];
    imagesCount = json['images_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['bio'] = this.bio;
    data['job_title'] = this.jobTitle;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['country'] = this.country;
    data['image'] = this.image;
    data['active'] = this.active;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['images_count'] = this.imagesCount;
    return data;
  }
}
