
import 'package:hive/hive.dart';

class HiveDB {
  static var box1 = Hive.box("baza1");
  static void storeString (String name){
    box1.put("name", name);
  }

  static String loadString(){
    return box1.get("name");
  }

  static void removeString(){
    box1.delete("name");
  }
}