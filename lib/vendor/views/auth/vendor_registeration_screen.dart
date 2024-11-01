
// import 'dart:typed_data';

// import 'package:country_state_city_picker/country_state_city_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:vendor_app_only/vendor/controllers/vendor_register_controller.dart';

// class VendorRegisterationScreen extends StatefulWidget {
//   const VendorRegisterationScreen({super.key});

//   @override
//   State<VendorRegisterationScreen> createState() => _VendorRegisterationScreenState();
  
// }

// class _VendorRegisterationScreenState extends State<VendorRegisterationScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   late String countryValue;
//   late String stateValue;
//   late String cityValue;

//   Uint8List? _image;

// selectGalleryImage() async {
//   // Await the future to get the Uint8List result
//   Uint8List im = await _vendorController.pickStoreImage(ImageSource.gallery);

//   setState(() {
//     _image = im;
//   });
// }
// selectCameraImage() async {
//   // Await the future to get the Uint8List result
//   Uint8List im = await _vendorController.pickStoreImage(ImageSource.camera);

//   setState(() {
//     _image = im;
//   });
// }

// String? _taxStatus;
// List<String> _taxOptions = ['YES', 'NO'];
//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//     final VendorRegisterController _vendorController = VendorRegisterController(); 
//     late String businessName;
//     late String email;
//     late String phoneNumber;

//     void _registerVendor() {
//       if (_formKey.currentState!.validate()) {
//         // Perform registration logic here
//         print('Business Name: $businessName');
//         print('Email: $email');
//         print('Phone Number: $phoneNumber');
//         // Show success message or navigate to another screen
//       }
//     }
// // selectGalleryImage()async{
 
// //  Uint8List  im = _vendorController.pickStoreImage(ImageSource.gallery);

// // setState(() {
// //   _image = im;
// // });

// // }

// // selectGalleryImage() async {
// //   Uint8List? im = await _vendorController.pickStoreImage(ImageSource.gallery);

// //   if (im != null) {
// //     setState(() {
// //       _image = im;
// //     });
// //   } else {
// //     // Handle the case when no image is selected (optional)
// //     print('No image was selected, please try again.');
// //   }
// // }




//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             toolbarHeight: 200,
//             flexibleSpace: LayoutBuilder(builder: (context, constraints) {
//               return FlexibleSpaceBar(
//                 background: Container(
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(colors: [
//                       Colors.blue,
//                       Colors.yellow,
//                     ]),
//                   ),
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 90,
//                           width: 90,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10)),
//                           child: _image!=null ? Image.memory(_image!): IconButton(
//                             onPressed: () {
//                               selectGalleryImage();
//                             },
//                             icon: Icon(CupertinoIcons.photo),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Text(
//                       "Vendor Registration",
//                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 20),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Business Name',
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter your business name';
//                         }
//                         return null;
//                       },
//                       onChanged: (value) {
//                         businessName = value;
//                       },
//                     ),
//                     SizedBox(height: 16),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Email Address',
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         return null;
//                       },
//                       onChanged: (value) {
//                         email = value;
//                       },
//                     ),
//                     SizedBox(height: 16),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Phone Number',
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter your phone number';
//                         }
//                         return null;
//                       },
//                       onChanged: (value) {
//                         phoneNumber = value;
//                       },
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(14.0),
//                       child: SelectState(
//                                     onCountryChanged: (value) {
//                                     setState(() {
//                                       countryValue = value;
//                                     });
//                                   },
//                                   onStateChanged:(value) {
//                                     setState(() {
//                                       stateValue = value;
//                                     });
//                                   },
//                                    onCityChanged:(value) {
//                                     setState(() {
//                                       cityValue = value;
//                                     });
//                                   },
                                  
//                                   ),
//                     ),
//                     SizedBox(height: 20),
//                     Row(children: [
//                      Text("Tax Registered?",
//                      style: TextStyle(
//                       fontSize:16,
//                       fontWeight: FontWeight.w500, 
//                      ),
//                      ) ,
//                      DropdownButtonFormField(
//                       items: _taxOptions.map<DropdownMenuItem<String>>((String value){
// return DropdownMenuItem<String>(
//   value:value,
//   child: Text(value));
//                       }).toList(),
//                        onChanged: (value){
//                         setState(() {
//                           _taxStatus = value;
//                         });
//                        },
//                        ),
                    
//                     ],)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // extension on FirebaseAuth {
// //   pickProfileImage(ImageSource gallery) {}
// // }
import 'dart:typed_data';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_app_only/vendor/controllers/vendor_register_controller.dart';

class VendorRegisterationScreen extends StatefulWidget {
  const VendorRegisterationScreen({super.key});

  @override
  State<VendorRegisterationScreen> createState() => _VendorRegisterationScreenState();
}

class _VendorRegisterationScreenState extends State<VendorRegisterationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final VendorRegisterController _vendorController = VendorRegisterController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String countryValue;
  late String stateValue;
  late String cityValue;

  late String businessName;
  late String email;
  late String phoneNumber;
  Uint8List? _image;
  String? _taxStatus;
  List<String> _taxOptions = ['YES', 'NO'];

  // Method for selecting image from the gallery
  selectGalleryImage() async {
    Uint8List im = await _vendorController.pickStoreImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  // Method for selecting image from the camera
  selectCameraImage() async {
    Uint8List im = await _vendorController.pickStoreImage(ImageSource.camera);
    setState(() {
      _image = im;
    });
  }

  // Register vendor method (stub for actual registration logic)
  void _registerVendor() {
    if (_formKey.currentState!.validate()) {
      // Perform registration logic here
      print('Business Name: $businessName');
      print('Email: $email');
      print('Phone Number: $phoneNumber');
      print('Country: $countryValue, State: $stateValue, City: $cityValue');
      print('Tax Status: $_taxStatus');
      // Show success message or navigate to another screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 200,
            flexibleSpace: LayoutBuilder(builder: (context, constraints) {
              return FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.yellow,
                    ]),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: _image != null
                              ? Image.memory(_image!)
                              : IconButton(
                                  onPressed: selectGalleryImage,
                                  icon: Icon(CupertinoIcons.photo),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Vendor Registration",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Business Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your business name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        businessName = value;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SelectState(
                        onCountryChanged: (value) {
                          setState(() {
                            countryValue = value;
                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            stateValue = value;
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            cityValue = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tax Registered?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Container(
                              width:100,
                              child: DropdownButtonFormField(
                                hint:Text("Select"),
                                items: _taxOptions
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: Text(value));
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _taxStatus = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 20),
                    // ElevatedButton(
                    //   onPressed: _registerVendor,
                    //   child: Text("Register Vendor"),
                    // ),

                    if(_taxStatus == 'YES')

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(decoration: InputDecoration(
                        labelText: 'Tax Number',
                      ),
                      ),
                    ),


                    InkWell(
                      onTap: (){},
                      child: Container(
                        height: 30,
                        width:MediaQuery.of(context).size.width -40,
                        decoration: BoxDecoration(color:Colors.yellow.shade900,
                        borderRadius:BorderRadius.circular(10), 
                        ),
                        child: Center(child: Text('Save',
                        style: TextStyle(
                      
                          fontSize: 18,
                          color:Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        ),),
                                      
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
