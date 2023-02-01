import '../../data/Models/PostModel.dart';

abstract class Apibloc{}
class ApiLoadingState extends Apibloc{}
class ApiErrorState extends Apibloc{
  String error;
  ApiErrorState(this.error);
}
class ApiSuccessfullyLoaded extends Apibloc{
  List<Post>  post;
  ApiSuccessfullyLoaded(this.post);
}
