import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eden_farm_test/src/core/bloc/profile_controller.dart';
import 'package:eden_farm_test/src/core/model/model_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceFireStoreRepository {
  late ProfileController profileService;

  ServiceFireStoreRepository() {
    profileService = ProfileController();
  }

  Future<T> request<T extends Model>(
      {String? query,
      required String collection,
      required QueryMethods method,
      Map<String, String>? headers,
      Map<String, dynamic>? body,
      void Function(Object error, QuerySnapshot? response, T model)? onError,
      required T model,
      bool showErrorSnackbar = true}) async {
    QuerySnapshot? response;

    body ??= {};

    try {
      // final encodedBody = jsonEncode(body);

      switch (method) {
        case QueryMethods.get:
          await FirebaseFirestore.instance
              .collection(collection)
              .get()
              .then((value) => value.docs.map((element) {
                    print(element.data());
                    return model.fromJson(element.data());
                  }));

          break;
        case QueryMethods.add:
          debugPrint(model.toJson().toString());
          FirebaseFirestore.instance
              .collection(collection)
              .add(model.toJson())
              .then((value) => debugPrint('success add'))
              .onError((error, stackTrace) =>
                  debugPrint("Failed to add user: $error"));
          break;
        case QueryMethods.update:
          FirebaseFirestore.instance
              .collection(collection)
              .doc('WQe2hyBbjwyYqqM8La5z')
              .update(body)
              .then((value) => debugPrint('success add'))
              .onError((error, stackTrace) =>
                  debugPrint("Failed to add user: $error"));

          FirebaseFirestore.instance
              .collection(collection)
              .get()
              .then((value) => value.docs.forEach((element) {
                    print(element.data());
                    return model.fromJson(element.data());
                  }));
          break;
        case QueryMethods.ordering:
          FirebaseFirestore.instance
              .collection(collection)
              .orderBy(query!, descending: true)
              .get()
              .then((value) => debugPrint('success add'))
              .onError((error, stackTrace) =>
                  debugPrint("Failed to add user: $error"));
          break;
        case QueryMethods.initDBCollection:
          final db = FirebaseFirestore.instance;
          db.collection(collection).add(body).then((DocumentReference doc) =>
              debugPrint('DocumentSnapshot added with ID: ${doc.id}'));
          break;
      }
      // model.fromJson(data);
    } on StateError catch (e) {
      String msg = e.toString();

      // if (e is Error) {
      //   msg = "$e\n${e.stackTrace!}";
      // } else if (e is FormatException) {
      //   msg = "$e\n${e.source!}";
      // }

      if (onError != null) onError(e, response, model);

      debugPrint([query, msg].toString());
    }

    return model;
  }
}

enum QueryMethods { get, ordering, add, update, initDBCollection }
