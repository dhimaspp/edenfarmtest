import 'package:equatable/equatable.dart';

class FirebaseEmailModel extends Equatable {
  const FirebaseEmailModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageUrl,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;

  factory FirebaseEmailModel.fromJson(Map<String, dynamic> json) =>
      FirebaseEmailModel(
        id: json['id'] ?? "",
        firstName: json['firstName'] ?? "",
        lastName: json['lastName'] ?? "",
        email: json['email'] ?? "",
        imageUrl: json['imageUrl'] ?? "",
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'imageUrl': imageUrl,
      };
  factory FirebaseEmailModel.empty() => const FirebaseEmailModel(
        id: "",
        firstName: "",
        lastName: "",
        email: "",
        imageUrl: "",
      );
  @override
  List<Object?> get props => [id, firstName, lastName, email, imageUrl];
}
