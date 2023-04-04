class ModelData{
  int? userId, id;
  String? title, body;

  ModelData({this.userId, this.id, this.title, this.body});

  ModelData.fromJson(Map<String, dynamic> json){
    this.id=json['id'];
    this.userId=json['userId'];
    this.title=json['title'];
    this.body=json['body'];
  }

  Map<String, dynamic> toJson()=>{
    "id": this.id,
    "userId": this.userId,
    "title": this.title,
    "body": this.body
  };
}