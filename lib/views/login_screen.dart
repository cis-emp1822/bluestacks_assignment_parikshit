import 'package:bluestacks_assignment_parikshit/helpers/globals.dart';
import 'package:bluestacks_assignment_parikshit/subviews/buttonsub.dart';
import 'package:bluestacks_assignment_parikshit/subviews/logo_widget.dart';
import 'package:bluestacks_assignment_parikshit/subviews/textfielder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluestacks_assignment_parikshit/cubits/login/login_cubit.dart';
import 'package:bluestacks_assignment_parikshit/cubits/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final screenCubit = LoginCubit();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FocusNode emailF = FocusNode();
  final FocusNode passwordF = FocusNode();
  @override
  void initState() {
    screenCubit.loadInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Gcolors.backgroundColor,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LogoWidget(),
        TextFielder(
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          controller: email,
          focusNode: emailF,
          nextNode: passwordF,
          label: 'Email Address',
        ),
        TextFielder(
          action: TextInputAction.done,
          type: TextInputType.visiblePassword,
          controller: password,
          focusNode: passwordF,
          nextNode: null,
          label: 'Password',
        ),
        ButtonSub(
          label: 'Login',
          onGo: () {
            FocusScope.of(context).unfocus();
          },
        )
      ],
    );
  }
}
