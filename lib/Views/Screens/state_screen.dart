import 'package:cemex_task/Services/Blocs/cemex_api_bloc.dart';
import 'package:cemex_task/Services/Blocs/cemex_api_events.dart';
import 'package:cemex_task/Services/Blocs/cemex_api_states.dart';
import 'package:cemex_task/Views/Screens/home_screen.dart';
import 'package:cemex_task/Views/Screens/loading_screen.dart';
import 'package:cemex_task/Views/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateScreen extends StatefulWidget {
  static const String stateScreenKey = '/StateScreenNavigation';
  const StateScreen({Key? key}) : super(key: key);

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  late CemexAPIBloc _cemexAPIBloc;

  @override
  void initState() {
    super.initState();
    _cemexAPIBloc = BlocProvider.of<CemexAPIBloc>(context);
    _cemexAPIBloc.add(CemexAPIGetDataEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _cemexAPIBloc.close();
  }

  void _onSubmitEmailAndPassword(String email, String password) {
    _cemexAPIBloc.email = email;
    _cemexAPIBloc.password = password;
    _cemexAPIBloc.add(CemexAPIGetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CemexAPIBloc, CemexAPIState>(
      builder: ((context, state) {
        if (state is CemexAPIInitialState) {
          return LoginScreen(
            onSubmit: _onSubmitEmailAndPassword,
            havingError: false,
            errorMessage: '',
          );
        } else if (state is CemexAPILoadingState) {
          return const LoadingScreen();
        } else if (state is CemexAPISuccessState) {
          return HomeScreen(trucks: state.trucks, user: state.userModel);
        } else if (state is CemexAPIErrorState) {
          return LoginScreen(
            onSubmit: _onSubmitEmailAndPassword,
            havingError: true,
            errorMessage: state.errorMessage,
          );
        }
        return const LoadingScreen();
      }),
    );
  }
}
