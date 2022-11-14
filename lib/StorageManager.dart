import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  //StorageManagerclasse wird genutzt um Shared Preferences Synchron im Produktivcode aufrufen zu können
  static void saveData(String key, dynamic value) async {
    //entsprechende konvertierung für die verschiedenen Datentypen welche zu speichern sind
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      print("Invalid Type");
    }
  }

  static Future<String?> readData(String key) async {
    //###### Wird nicht verwendet ######
    //readData Methode -> wird im Code nicht verwendet da nicht funktionsfähig!
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString('faecher');

    if(prefs.get('faecher') == null){
       return "";
    }
    return result;
  }

  static Future<bool> deleteData(String key) async {
    //löschen von Daten
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}