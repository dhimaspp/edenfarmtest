import 'package:eden_farm_test/src/core/model/model_repository.dart';

class ProfileModel extends Model {
  String? name;
  String? gender;
  String? dateBirth;
  String? height;

  // ProfileModel({this.name, this.gender, this.dateBirth, this.height});
  @override
  void fromJson(Map<String, dynamic> data) {
    name = data['name'];
    gender = data['gender'];
    dateBirth = data['dateBirth'];
    height = data['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['gender'] = gender;
    data['dateBirth'] = dateBirth;
    data['height'] = height;
    return data;
  }
}
