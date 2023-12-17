import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'entry_screen.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 41, 36, 36),
                Color.fromARGB(255, 127, 60, 39),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Entry(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// class Authentication {
//   static Future<bool> authenticateWithBiometrics() async {
//     final LocalAuthentication localAuthentication = LocalAuthentication();
//     bool isBiometricSupported = await localAuthentication.isDeviceSupported();
//     bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

//     bool isAuthenticated = false;

//     if (isBiometricSupported && canCheckBiometrics) {
//       isAuthenticated = await localAuthentication.authenticate(
//         localizedReason: 'Please complete the biometrics to proceed.',
//         biometricOnly: true,
//         //  stickyAuth: true,
//       );
//     }

//     return isAuthenticated;
//   }
// }
