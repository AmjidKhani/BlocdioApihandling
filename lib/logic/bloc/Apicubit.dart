import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/Models/PostModel.dart';
import '../Reposatory/Reposatory.dart';
import 'Apibloc.dart';

class ApiCubit extends Cubit<Apibloc>{
  ApiCubit():super(ApiLoadingState()){
    fetchApiData();
  }


Future fetchApiData()async{
  Reposatory reposatory=Reposatory();
  try{
    List<Post> posting=await reposatory.fetchPost();
    emit(ApiSuccessfullyLoaded(posting));
  }catch(ex){
emit(ApiErrorState(ex.toString()));
  }}



}