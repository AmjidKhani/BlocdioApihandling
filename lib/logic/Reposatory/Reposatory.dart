import 'dart:math';

import 'package:blocapihandlong/data/Api/Api.dart';
import 'package:dio/dio.dart';

import '../../data/Models/PostModel.dart';

class Reposatory{
  Api api=Api();
  Future<List<Post>> fetchPost()async{
    try
    {
      Response response= await api.sendPost.get('/posts');
     // log(response.data);
     List<dynamic> post=response.data;
     return post.map((map) {
       return   Post.fromJson(map);
     }).toList();
    }
    catch(ex){
      throw ex;
    }
}
}