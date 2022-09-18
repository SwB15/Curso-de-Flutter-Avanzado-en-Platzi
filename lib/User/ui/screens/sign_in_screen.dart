import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../../../platzi_trips_cupertino.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    // ignore: todo
    // TODO: implement build
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return signInGoogleUI();
          } else {
            return PlatziTripsCupertino();
          }
        });
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: <Widget>[
        GradientBack("", null),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome\n this is your Travel App",
              style: TextStyle(
                  fontSize: 37.0,
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            ButtonGreen(
              text: "Login with Gmail",
              onPressed: () {
                userBloc.signIn().then(
                    (User user) => print("El usuario es ${user.displayName}"));
              },
              width: 300.0,
              heigth: 50.0,
            )
          ],
        )
      ]),
    );
  }
}
