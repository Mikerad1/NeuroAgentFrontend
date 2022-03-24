import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:neuroagent/models/ritual.dart';

class ProviderData extends ChangeNotifier{
  final storage = FlutterSecureStorage();

  List<Ritual> _rituals = [
    Ritual(1, "Counting House Doors", 0, DateTime.now()),
    Ritual(2, "Counting Main Gate", 0, DateTime.now()),
    Ritual(3, "Counting Car Doors", 0, DateTime.now()),
    Ritual(4, "Counting Parents House Doors", 0, DateTime.now()),
    Ritual(5, "Counting Parents Car Doors", 0, DateTime.now()),
    Ritual(6, "Counting Friends Car Doors", 0, DateTime.now()),
    Ritual(7, "Counting Front Gate", 0, DateTime.now()),
    Ritual(8, "Counting Back Gate", 0, DateTime.now()),
    Ritual(9, "Counting Outside Right Gate", 0, DateTime.now()),
    Ritual(10, "Counting Outside Left Gate", 0, DateTime.now())
  ];

  int get ritualsItemCount {
    return _rituals.length;
  }

  UnmodifiableListView get rituals {
    return UnmodifiableListView(_rituals);
  }


  void writeAccessToken(String accessToken) async{
    await storage.write(key: "access_token", value: accessToken);
  }

  void addRitual(String name){
    //Call api here
    _rituals.add(Ritual(_rituals.length + 1, name, 0, DateTime.now()));
    notifyListeners();
  }

  void incrementRitual(int id){
    //Call api here
    _rituals.firstWhere((element) => element.id == id).count++;
    notifyListeners();
  }
}