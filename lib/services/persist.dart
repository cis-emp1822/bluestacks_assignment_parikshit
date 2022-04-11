import 'dart:convert';
import 'package:bluestacks_assignment_parikshit/helpers/globals.dart';
import 'package:xxtea/xxtea.dart' as xxtea;
import 'package:get_storage/get_storage.dart';

class Persist {
  Persist({this.db});
  GetStorage? db;

  Future deleteAllDB() async {
    await db?.erase();
  }

  Future<Map<String, dynamic>> getOne(String key) async {
    String? raw = db?.read<String>(key);
    if (raw == null) {
      return {};
    } else {
      String? decryptData =
          xxtea.xxteaDecryptToString(raw, Globals.encryptionKey);
      return jsonDecode(decryptData!);
    }
  }

  Future<void> saveOne(String key, Map<String, dynamic> value) async {
    String raw = jsonEncode(value);
    String? encryptData =
        xxtea.xxteaEncryptToString(raw, Globals.encryptionKey);
    if (db!.hasData(key)) {
      await db?.write(key, encryptData);
    } else {
      await db?.write(key, encryptData);
    }
    return;
  }

  Future<void> deleteAny(String key) async {
    // while (prefs == null) await Future.delayed(Duration(milliseconds: 70));

    await db!.remove(key);
    return;
  }

  Future<List<Map<String, dynamic>>> getMany(String key) async {
    List<String>? raw = db!.read<List<String>>(key);
    if (raw == null) {
      return [];
    } else {
      List<Map<String, dynamic>> objects = [];
      for (var si in raw) {
        String? decryptData =
            xxtea.xxteaDecryptToString(si, Globals.encryptionKey);
        objects.add(jsonDecode(decryptData!));
      }
      return objects;
    }
  }

  Future<void> saveMany(String key, List<Map<String, dynamic>> value) async {
    List<String> raws = [];
    for (var si in value) {
      var text = jsonEncode(si);
      String? encryptData =
          xxtea.xxteaEncryptToString(text, Globals.encryptionKey);
      raws.add(encryptData!);
    }
    if (db!.hasData(key)) {
      await db?.write(key, raws);
    } else {
      await db?.write(key, raws);
    }
    return;
  }
}
