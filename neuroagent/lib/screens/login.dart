import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:neuroagent/screens/ocdtracker.dart';
import 'package:neuroagent/services/authentication.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String accessToken = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 150.0,
          left: 50.0,
          right: 30.0,
          bottom: 30.0,
        ),
        child: Column(
          children: [
            const Image(
              image: AssetImage("assets/images/NeuroAgent.png"),
            ),
            ElevatedButton(
              onPressed: () async {
                //Authentication authentication = Authentication();
                //accessToken = await authentication.Authenticate();
                FlutterAppAuth appAuth = FlutterAppAuth();
                final AuthorizationTokenResponse result =
                await appAuth.authorizeAndExchangeCode(
                  AuthorizationTokenRequest(
                      'flutter', 'com.michaelrademeyer.neuroagent://oauth2callback',
                      discoveryUrl:
                      'http://10.0.0.16:5000/.well-known/openid-configuration',
                      scopes: [
                        'openid',
                        'profile',
                        'offline_access',
                        'neuroagentapi'
                      ],
                      allowInsecureConnections: true),
                ) as AuthorizationTokenResponse;
                setState(() {
                  accessToken = result.accessToken as String;
                });
                //Navigator.push(context, MaterialPageRoute(builder: (context) => OCDTracker()));
              },
              child: const Text("Login"),
            ),
            Text(
              "Access Token is ${accessToken}",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
