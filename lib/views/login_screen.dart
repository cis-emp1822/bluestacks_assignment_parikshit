import 'package:bluestacks_assignment_parikshit/helpers/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluestacks_assignment_parikshit/cubits/login/login_cubit.dart';
import 'package:bluestacks_assignment_parikshit/cubits/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final screenCubit = LoginCubit();

  @override
  void initState() {
    screenCubit.loadInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        bloc: screenCubit,
        listener: (BuildContext context, LoginState state) {
          if (state.error != null) {}
        },
        builder: (BuildContext context, LoginState state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return buildBody(state);
        },
      ),
    );
  }

  Widget buildBody(LoginState state) {
    return ListView(
      children: [Image.asset(Assets.game_tv_logo2)],
    );
  }
}
