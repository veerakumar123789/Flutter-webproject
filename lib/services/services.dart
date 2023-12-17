import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:webproject/user_model/user_model.dart';

class ApiServices{


  Future<List<UserModel>>getUser()async{
    String Url = 'https://reqres.in/api/user?page=2';
    var response = await http.get(Uri.parse(Url));

    if(response.statusCode == 200){
      final List reslt = jsonDecode(response.body)['data'];
      return reslt.map(((e) => UserModel.fromJson(e))).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}
final state = Provider<ApiServices>((ref)=> ApiServices());