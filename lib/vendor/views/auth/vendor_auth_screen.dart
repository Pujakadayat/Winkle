// import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:vendor_app_only/vendor/views/auth/vendor_registeration_screen.dart';
// import 'package:vendor_app_only/vendor/views/screens/landing_screen.dart';

// class VendorAuthScreen extends StatefulWidget {
//   const VendorAuthScreen({super.key});

//   @override
//   State<VendorAuthScreen> createState() => _VendorAuthScreenState();
// }

// class _VendorAuthScreenState extends State<VendorAuthScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//     initialData: FirebaseAuth.instance.currentUser, 
//     builder: (context, snapshot)  {
// if(!snapshot.hasData){
//   return SignInScreen(
//     providerConfigs: [
// EmailProviderConfiguration(),
// GoogleProviderConfiguration(
//   clientId:'6329481609-l9cktuok4drm1g2rtfab0vuukd0s459t.apps.googleusercontent.com',
//   PhoneProviderConfiguration(),
//  )
//     ],
//   );
//   }
//   // return VendorRegisterationScreen();
//   return LandingScreen();
//     },
//     );
//   }
// }


// import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider, PhoneAuthProvider, GoogleAuthProvider;
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';  // Use providers from this package
// import 'package:flutter/material.dart';
// import 'package:vendor_app_only/vendor/views/auth/vendor_registeration_screen.dart';
// import 'package:vendor_app_only/vendor/views/screens/landing_screen.dart';

// class VendorAuthScreen extends StatefulWidget {
//   const VendorAuthScreen({super.key});

//   @override
//   State<VendorAuthScreen> createState() => _VendorAuthScreenState();
// }

// class _VendorAuthScreenState extends State<VendorAuthScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       initialData: FirebaseAuth.instance.currentUser,
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return SignInScreen(
//             providerConfigs: [
//               EmailProviderConfiguration(),
//               GoogleProviderConfiguration(clientId: '7329481609-l9cktuok4drm1g2rtfab0vuukd0s459t.apps.googleusercontent.com'),  // Replace with actual client ID if required
//               PhoneProviderConfiguration(),
//             ],
//           );
//         }
//         return LandingScreen();
//       },
//     );
//   }
// }

// class PhoneProviderConfiguration {
// }

// class GoogleProviderConfiguration {
// }

// class EmailProviderConfiguration {
// }

import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider, PhoneAuthProvider, GoogleAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';  // Use providers from this package
import 'package:flutter/material.dart';
import 'package:vendor_app_only/vendor/views/auth/vendor_registeration_screen.dart';
import 'package:vendor_app_only/vendor/views/screens/landing_screen.dart';

class VendorAuthScreen extends StatefulWidget {
  const VendorAuthScreen({super.key});

  @override
  State<VendorAuthScreen> createState() => _VendorAuthScreenState();
}

class _VendorAuthScreenState extends State<VendorAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
              // GoogleProviderConfiguration(),
              // PhoneProviderConfiguration(),
            ],
          );
        }
        return  const LandingScreen();
      },
    );
  }
}

class PhoneProviderConfiguration {
}

class GoogleProviderConfiguration {
}
