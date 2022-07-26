import 'package:cemex_task/Models/truck_model.dart';
import 'package:cemex_task/Models/user_model.dart';

class CemexAPIState {}

class CemexAPIInitialState extends CemexAPIState {}

class CemexAPILoadingState extends CemexAPIState {}

class CemexAPISuccessState extends CemexAPIState {
  final List<TruckModel> trucks;
  final UserModel userModel;
  CemexAPISuccessState({required this.trucks, required this.userModel});
}

class CemexAPIErrorState extends CemexAPIState {
  final String errorMessage;
  CemexAPIErrorState({required this.errorMessage});
}
