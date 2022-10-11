import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences pref;

  static init()async{
    pref=await SharedPreferences.getInstance();
  }

  static Future<bool> putData(String key,dynamic value)async{
    if(value is String){
      return await pref.setString(key, value);
    }else if(value is bool){
      return await pref.setBool(key, value);
    }else{
      return await pref.setInt(key, value);
    }
  }
 static dynamic getData(String key){
      return pref.get(key); 
  }
  static Future<bool> removeData(String key)async{
      return await pref.remove(key);
    
  }
}