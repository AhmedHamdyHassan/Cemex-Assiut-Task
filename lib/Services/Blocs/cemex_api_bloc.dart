import 'package:cemex_task/Models/truck_model.dart';
import 'package:cemex_task/Models/user_model.dart';
import 'package:cemex_task/Services/APIs/connect_with_cemex_api.dart';
import 'package:cemex_task/Services/Blocs/cemex_api_events.dart';
import 'package:cemex_task/Services/Blocs/cemex_api_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CemexAPIBloc extends Bloc<CemexAPIEvents, CemexAPIState> {
  String? email, password;
  CemexAPIBloc(super.initialState) {
    on((event, emit) async {
      if (event is CemexAPIGetDataEvent) {
        if (email == null && password == null) {
          emit(CemexAPIInitialState());
        } else {
          emit(CemexAPILoadingState());
          try {
            List<dynamic> data =
                await ConnectWithCemexAPI.getDataFromAPI(email!, password!);
            UserModel user = data[0] as UserModel;
            List<TruckModel> trucks = data[1] as List<TruckModel>;
            emit(CemexAPISuccessState(trucks: trucks, userModel: user));
          } catch (e) {
            emit(CemexAPIErrorState(errorMessage: e.toString()));
          }
        }
      }
    });
  }
}
