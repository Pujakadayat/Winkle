// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:vendor_app_only/vendor/models/vendor_user_models.dart';

// class LandingScreen extends StatelessWidget {
//   const LandingScreen({super.key});

 
//   @override
//   Widget build(BuildContext context) {
// final FirebaseAuth _auth = FirebaseAuth.instance;
// final CollectionReference _vendorsStream = FirebaseFirestore.instance.collection('vendors');

//     return Scaffold(
//       body:StreamBuilder<QuerySnapshot>(
//       stream: _vendorsStream.doc(_auth.currentUser!.uid).snapshots(),
//       builder:
//        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return const Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Text("Loading");
//         }
// VendorUserModels vendorUserModel = VendorUserModels.fromJson(
//   snapshot.data!.data()! as Map<String, dynamic> );

//         return Center(child: 
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(vendorUserModel.businessName.toString()),
//           ],
//         ));
//       },
//     ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app_only/vendor/models/vendor_user_models.dart';
import 'package:vendor_app_only/vendor/views/auth/vendor_registeration_screen.dart';
import 'package:vendor_app_only/vendor/views/screens/main_vendor_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final DocumentReference _vendorDoc = FirebaseFirestore.instance
        .collection('vendors')
        .doc(_auth.currentUser!.uid);

    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: _vendorDoc.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading..."));
          }

          // if (!snapshot.hasData || !snapshot.data!.exists) {
          //   return const Center(child: Text("No data found"));
          // }
            if ( !snapshot.data!.exists) {
            return VendorRegisterationScreen();
          }

          final vendorUserModel = VendorUserModels.fromJson(
            snapshot.data!.data() as Map<String, Object>,
          );


if(vendorUserModel.approved== true){
  return MainVendorScreen();
}
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
ClipRRect(
  borderRadius: BorderRadius.circular(5),
  child: Image.network(
    vendorUserModel.storeImage.toString(),
    width:90,
    fit:BoxFit.cover,
    ),
),


const SizedBox(height: 15),

Text(vendorUserModel.businessName.toString(),
style: const TextStyle(
  fontSize: 22,
  fontWeight:FontWeight.w500,
),
),
const SizedBox(height: 10,),

const Text(
  
  'Your application has been sent to shop admin\n Admin will get back to you soon',
style: TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w400,
),
textAlign: TextAlign.center,
),


const SizedBox(height: 10,),

TextButton(
  onPressed: () async{
await _auth.signOut();
  }, 
  child: Text('SignOut')
  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
