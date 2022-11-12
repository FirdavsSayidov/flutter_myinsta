import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_myinsta/model/pref_model.dart';

import '../model/user_model.dart';

class DataService{

  static Future storeUser(Userr user) async{
    user.uid = (await Prefs.loadUserId())!;
    final instance = FirebaseFirestore.instance;
    return instance.collection("users").doc(user.uid).set(user.toJson());
  }


  static Future <Userr> loadUser() async {
    String? uid = await Prefs.loadUserId();
    final instance = FirebaseFirestore.instance;
    var value = await instance.collection("users").doc(uid).get();
    return Userr.fromJson(value.data()!);
  }

  static Future updateUser(Userr user) async {
    String? uid = await Prefs.loadUserId();
    final instance = FirebaseFirestore.instance;
    return instance.collection("users").doc(uid).update(user.toJson());
  }

  static Future <List<Userr>> searchUsers(String keyword) async{
    List<Userr> users = [];
    final instance = FirebaseFirestore.instance;
    var querySnapshot = await instance.collection("users").orderBy("email").startAt([keyword]).get();
  print(querySnapshot.docs.toString());

  querySnapshot.docs.forEach((element) {
    users.add(Userr.fromJson(element.data()));
  });
  return users;
  }

}