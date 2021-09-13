class Clients {
  int? id;
  int? operatorId;
  int? creatorId;
  String? name;
  String? lastName;
  String? fatherName;
  String? birthday;
  String? address;
  String? phoneOne;
  String? phoneTwo;
  String? phoneThree;
  String? email;
  String? password;
  String? clientHandId;
  String? createdAt;
  String? updatedAt;
  String? gender;
  String? beginNamaz;

  Clients(
      {this.id,
        this.operatorId,
        this.creatorId,
        this.name,
        this.lastName,
        this.fatherName,
        this.birthday,
        this.address,
        this.phoneOne,
        this.phoneTwo,
        this.phoneThree,
        this.email,
        this.password,
        this.clientHandId,
        this.createdAt,
        this.updatedAt,
        this.gender,
        this.beginNamaz});

  Clients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    operatorId = json['operator_id'];
    creatorId = json['creator_id'];
    name = json['name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    birthday = json['birthday'];
    address = json['address'];
    phoneOne = json['phone_one'];
    phoneTwo = json['phone_two'];
    phoneThree = json['phone_three'];
    email = json['email'];
    password = json['password'];
    clientHandId = json['client_hand_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    gender = json['gender'];
    beginNamaz = json['begin_namaz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['operator_id'] = this.operatorId;
    data['creator_id'] = this.creatorId;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['father_name'] = this.fatherName;
    data['birthday'] = this.birthday;
    data['address'] = this.address;
    data['phone_one'] = this.phoneOne;
    data['phone_two'] = this.phoneTwo;
    data['phone_three'] = this.phoneThree;
    data['email'] = this.email;
    data['password'] = this.password;
    data['client_hand_id'] = this.clientHandId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['gender'] = this.gender;
    data['begin_namaz'] = this.beginNamaz;
    return data;
  }
}
