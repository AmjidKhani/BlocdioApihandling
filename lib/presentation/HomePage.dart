import 'package:blocapihandlong/logic/Reposatory/Reposatory.dart';
import 'package:blocapihandlong/logic/bloc/Apibloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/Models/PostModel.dart';
import '../logic/Reposatory/Reposatory.dart';
import '../logic/Reposatory/Reposatory.dart';
import '../logic/bloc/Apicubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Reposatory reposatory=Reposatory();
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),),
      body: Column(
        children: [
        BlocConsumer<ApiCubit,Apibloc>(builder: (BuildContext context, state) {
          if(state is ApiLoadingState){
            return Center(child: CircularProgressIndicator());
          }
          if (state is ApiSuccessfullyLoaded) {
           return Expanded(
             child: ListView.builder(
               itemCount: state.post.length,
                  itemBuilder: (context, index) {
                  var posts=  state.post[index];
                  return Card(
                    child: ListTile(

                      title: Text(posts.title!),
                      subtitle: Text(posts.body!),

                    ),
                  );
                  },
              
              ),
           );
          }
          return ListTile(

            title: Text('Title of the page'),
            subtitle: Text("SubTitle"),

          );
        }, listener: (BuildContext context, Object? state) { 
          if(state is ApiErrorState){
             ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                   duration: Duration(seconds: 3),
                     backgroundColor: Colors.red,
                     content: Text(state.error)
                 )
             );
          }
        },)
        ],
      )
    
    );

  }
}
