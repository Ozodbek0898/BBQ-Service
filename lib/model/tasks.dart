class Tasks {
  int? id;
  int? clientId;
  String? task;
  String? requiredTime;
  String? status;
  String? createdAt;
  String? updatedAt;

  Tasks(
      {this.id,
        this.clientId,
        this.task,
        this.requiredTime,
        this.status,
        this.createdAt,
        this.updatedAt});

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    task = json['task'];
    requiredTime = json['required_time'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_id'] = this.clientId;
    data['task'] = this.task;
    data['required_time'] = this.requiredTime;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
