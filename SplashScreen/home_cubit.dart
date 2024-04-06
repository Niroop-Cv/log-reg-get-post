import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Datapages/Datapages.dart';
import 'package:flutter_application_5/Homepages/Loginpage.dart';
import 'package:flutter_application_5/Sharedpriferance/sharedpriference.dart';
import 'package:meta/meta.dart';

import '../homepages/home_cubit.dart';
part 'home_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(HomeInitial()) {
    delay();
  }

  BuildContext context;

  delay() async {
    await Future.delayed(const Duration(seconds: 5));
    flash();
  }

  flash() async {
    token = await LocalStorage().setApi();
    print(">>>>>>>>.$token");

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => token == null ? const login() : const datas()),
    );
  }
}
