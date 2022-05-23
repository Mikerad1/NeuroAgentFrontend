import 'package:flutter_appauth/flutter_appauth.dart';

class Authentication {
  FlutterAppAuth appAuth = FlutterAppAuth();

  Future<String> Authenticate() async {
    final AuthorizationTokenResponse result =
        await appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
          'flutter', 'com.michaelrademeyer.neuroagent:/oauth2callback',
          discoveryUrl:
              'http://10.0.0.26:5000/.well-known/openid-configuration',
          scopes: [
            'openid',
            'profile',
            'offline_access',
            'neuroagentapi'
          ],
          allowInsecureConnections: true),
    ) as AuthorizationTokenResponse;
    print("Access token is ${result.accessToken}");

    return result.accessToken as String;
  }
}
