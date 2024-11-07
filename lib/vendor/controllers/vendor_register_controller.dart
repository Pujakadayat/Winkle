// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

// class VendorRegisterController {
// final FirebaseStorage _storage = FirebaseStorage.instance;
// final FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;


// //FUNCTION TO STORE IMAGE IN FIREBASE STORE


// _uploadVendorImageToStore(Uint8List? image) async{

//  Reference ref  = _storage.ref().child('storeImage').child(_auth.currentUser!.uid);


// UploadTask uploadTask = ref.putData(image!);


// TaskSnapshot snapshot = await uploadTask;
// String downloadUrl = await snapshot.ref.getDownloadURL();

// return downloadUrl;

// }

// //FUNTION TO STORE IMAGE IN FIREBASE STORAGE ENDS HERE




// // function to pick store image
//   pickStoreImage(ImageSource source) async{
//     final ImagePicker _imagePicker = ImagePicker();
//   XFile? _file = await _imagePicker.pickImage(source: source); // xfile? question mark le null hunu hunna vanera indicate garxa

// if(_file!=null){
//   return await _file.readAsBytes();
// }else{
//   print("no image selectes");
// }
//   }

//   // funtiom to pick store image ends here
// //FUNCTION TO SAVE VENDOR DATA

//   Future <String> registerVendor(
//     String businessName,
//      String email, 
//      String phoneNumber,
//       String countryValue,
//       String stateValue, 
//       String cityValue,
//        String taxRegistered, 
//        String taxNumber ,
//        Uint8List? image,
//        )
//       async {

//  String res= 'some error occured';
//  try {
 

// String storeImage = await _uploadVendorImageToStore(image);
//       //SAVE DATA TO CLOUD FIRESTORE

// await  _firestore.collection('vendore').doc(_auth.currentUser!.uid).set({
//   'businessName': businessName,
//   'email': email,
//   'phoneNumber':phoneNumber,
//   'countryValue':countryValue,
//   'stateValue' : stateValue,
//   'cityValue': cityValue,
//   'taxRegistered' :taxRegistered,
//   'taxNumber' :taxNumber