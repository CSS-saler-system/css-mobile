// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// import 'package:bee/auth/auth_helper.dart';
// import 'package:bee/helper/firebase_helper.dart';
// import 'package:bee/models/Account.dart';
// import 'package:bee/screens/login/login_screen.dart';
// import 'package:bee/utils/utils.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// import '../constants.dart';

// class UserController extends GetxController {
//   late Function onExistsPhoneNumber;
//   late Function onDoNotExistsPhoneNumber;
//   late Function warningInService;
//   late Function onLoginSuccess;
//   late Function onWrongSMSOTP;
//   late Function onSMSOTPExpired;
//   late Function onNavigateToMainScreen;
//   late Function onNavigateToCollectInformationScreen;
//   late Function onCreateUserSuccess;
//   late Function onAuthSuccess;
//   late Function onEmptyOtp;
//   late User firebaseUser;
//   late Timer timer;
//   ImagePicker imagePicker = ImagePicker();

//   Rx<String> msgError = Rx<String>('');

//   Rx<int> start = Rx<int>(0);

//   Rx<UserApp> user = Rx<UserApp>();

//   Rx<bool> isShowLoading = Rx<bool>(false);

//   bool isLoginError = false;

//   void startTimer() {
//     const oneSec = const Duration(seconds: 1);
//     timer = Timer.periodic(oneSec, (Timer timer) {
//       if (start.value < 1) {
//         timer.cancel();
//       } else {
//         start.value = start.value - 1;
//       }
//     });
//   }

//   loginWithPhoneNumber(String phoneNumber) async {
//     isShowLoading.value = true;
//     await AuthHelper.verifyPhoneNumber(phoneNumber);
//     isShowLoading.value = false;
//   }

//   resendOTP(String phoneNumber) {
//     loginWithPhoneNumber(addCountryCode(phoneNumber));
//   }

//   checkExistPhoneNumber(String phoneNumber) async {
//     isShowLoading.value = true;
//     DocumentSnapshot documentSnapshot = await FirebaseHelper.fireStoreReference
//         .collection(Constants.USER_COLLECTION)
//         .doc(addCountryCode(phoneNumber))
//         .get();
//     if (documentSnapshot.exists) {
//       onExistsPhoneNumber();
//       isShowLoading.value = false;
//     } else {
//       onDoNotExistsPhoneNumber();
//       isShowLoading.value = false;
//     }
//   }

//   verifyPhoneNumber(String smsOTP) async {
//     if (smsOTP.isNotEmpty) {
//       isShowLoading.value = true;
//       AuthCredential credential;
//       credential = PhoneAuthProvider.credential(
//         verificationId: AuthHelper.finalVerificationId.toString(),
//         smsCode: smsOTP,
//       );
//       await FirebaseAuth.instance
//           .signInWithCredential(credential)
//           .catchError((error) {
//         if (error.message.contains('The sms verification code used to create the phone auth credential is invalid') ||
//             error.message.contains(
//                 'The phone auth credential was created with an empty verification ID.') ||
//             error.message.contains(
//                 'The SMS verification code used to create the phone auth credential is invalid') ||
//             error.message.contains(
//                 'The phone auth credential was created with an empty SMS verification Code.')) {
//           onWrongSMSOTP();
//           isShowLoading.value = false;
//         } else if (error.message.contains(
//                 'The SMS code has expired. Please re-send the verification code to try again.') ||
//             error.message.contains(
//                 'The sms code has expired. Please re-send the verification code to try again.')) {
//           isShowLoading.value = false;
//         }
//       }).then((result) async {
//         print(result);
//         if (result != null) {
//           await loadUserData(result.user.phoneNumber);
//           if (user.value != null) {
//             isShowLoading.value = false;
//             onAuthSuccess();
//           } else {
//             firebaseUser = AuthHelper.auth.currentUser!;
//             if (firebaseUser != null) {
//               onNavigateToCollectInformationScreen();
//             }
//           }
//         }
//       });
//     }
//   }

//   createNewUser(
//       {required String uid,
//       required String displayName,
//       required String phoneNumber,
//       required String referral,
//       required num birthday,
//       required bool isVerifyPhone}) async {
//     isShowLoading.value = true;
//     await FirebaseHelper.fireStoreReference
//         .collection(Constants.USER_COLLECTION)
//         .doc(phoneNumber)
//         .set({
//       // ignore: deprecated_member_use
//       // "email": googleSignIn.currentUser.isNullOrBlank?'':googleSignIn.currentUser.email,
//       // "facebookId":facebookUser==null?'':facebookUser['id'],
//       "displayName": displayName ?? '',
//       "imgURL": '',
//       "phoneNumber": phoneNumber.trim(),
//     });
//     await loadUserData(phoneNumber);
//     onCreateUserSuccess();
//     isShowLoading.value = false;
//   }

//   updateUserName(Map<String, dynamic> data) async {
//     await FirebaseHelper.fireStoreReference
//         .collection(Constants.USER_COLLECTION)
//         .doc(user.value.phoneNumber)
//         .update(data);
//   }

//   loadUserData(String uid) async {
//     isShowLoading.value = true;
//     try {
//       DocumentSnapshot doc = await FirebaseHelper.fireStoreReference
//           .collection(Constants.USER_COLLECTION)
//           .doc(uid)
//           .get();
//       user.value = UserApp.fromJson(doc.data());
//       await _saveUserData(jsonEncode(user.value.toJson()));
//     } catch (e) {}
//     isShowLoading.value = false;
//   }

//   Future choosePhotoFromLibrary() async {
//     var image = await imagePicker.getImage(
//         source: ImageSource.gallery, maxHeight: 400, maxWidth: 400);
//     if (image != null) {
//       isShowLoading.value = true;
//       await uploadPhoto(File(image.path));
//       loadUserData(user.value.phoneNumber);
//     }
//     isShowLoading.value = false;
//   }

//   Future takeNewPhoto() async {
//     var image = await imagePicker.getImage(
//         source: ImageSource.camera, maxHeight: 400, maxWidth: 400);
//     if (image != null) {
//       isShowLoading.value = true;
//       await uploadPhoto(File(image.path));
//       loadUserData(user.value.phoneNumber);
//     }
//     isShowLoading.value = false;
//   }

//   uploadPhoto(File image) async {
//     String imageName = 'avatar';
//     Reference storageReference = FirebaseStorage.instance
//         .ref()
//         .child(user.value.phoneNumber)
//         .child(imageName);
//     FirebaseHelper.uploadTask = storageReference.putFile(image);
//     FirebaseHelper.storageTaskSnapshot =
//         await FirebaseHelper.uploadTask.onComplete;
//     var urlImage =
//         await FirebaseHelper.storageTaskSnapshot?.ref.getDownloadURL();
//     FirebaseHelper.fireStoreReference
//         .collection(Constants.USER_COLLECTION)
//         .doc(user.value.phoneNumber)
//         .update({'imgURL': urlImage});
//   }

//   /// LOG OUT

//   logout() async {
//     isShowLoading.value = true;
//     //await _removeDataSharedPreferences();
//     await FirebaseHelper.fireBaseAuth.signOut();
//     //await googleSignIn.signOut();
//     //await facebookLogin.logOut();
//     //facebookUser=null;
//     phoneNumberExist = null;
//     firebaseUser = null;
//     isShowLoading.value = false;
//     Get.to(LoginScreen());
//   }

//   _saveUserData(String userData) async {
//     SharedPreferencesHelper.saveStringValue(
//         SharedPreferencesHelper.USER, userData);
//   }

//   _removeDataSharedPreferences() {
//     SharedPreferencesHelper().remove(SharedPreferencesHelper.USER);
//   }

//   //Collect customer information
//   Rx<bool> nameValid = Rx<bool>(false);
//   Rx<String> errorMsg = Rx<String>('');

//   //var facebookUser;
//   String? phoneNumberExist;
//   //Google Login
//   // final GoogleSignIn googleSignIn=GoogleSignIn(scopes: ['email']);

//   // signInWithGoogle() async{
//   //   try{
//   //     isShowLoading.value=true;
//   //     final googleSignInAccount =await googleSignIn.signIn();
//   //     // ignore: deprecated_member_use
//   //     if(googleSignIn.currentUser.isNullOrBlank){
//   //       isShowLoading.value=false;
//   //       return false;
//   //     }
//   //     else{
//   //       bool valid=await checkEmailGGExistOrNot(googleSignInAccount.email);
//   //       if(valid){
//   //         Get.to(InputPhoneNumber());
//   //         isShowLoading.value=false;
//   //         return true;
//   //       }
//   //       else{
//   //         await loadUserData(phoneNumberExist);
//   //         Get.to(MenuMainScreen());
//   //       }
//   //     }
//   //   }
//   //   catch(err){
//   //     print(err);
//   //   }
//   // }

//   // Future<bool> checkEmailGGExistOrNot(String email) async{
//   //   isShowLoading.value=true;
//   //   final QuerySnapshot result = await FirebaseHelper.fireStoreReference.collection(Constants.USER_COLLECTION).where('email',isEqualTo: email).limit(1).get();
//   //   var docs=result.docs.length;
//   //   if(docs > 0) {
//   //     result.docs.forEach((DocumentSnapshot snap) {
//   //       phoneNumberExist=snap.id;
//   //     });
//   //     isShowLoading.value=false;
//   //     return false;
//   //   }
//   //   else{
//   //     isShowLoading.value=false;
//   //     return true;
//   //   }
//   // }

//   //Facebook Login
//   // final FacebookLogin facebookLogin=FacebookLogin();

//   // signInWithFaceBook() async{
//   //   final FacebookLoginResult result=await facebookLogin.logIn(['email']);

//   //   switch(result.status){
//   //     case FacebookLoginStatus.loggedIn:
//   //       isShowLoading.value=true;
//   //       final String token=result.accessToken.token;
//   //       final graphResponse = await http.get(
//   //           'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
//   //       facebookUser = jsonDecode(graphResponse.body);
//   //       bool valid =await checkFBIdExistOrNot(facebookUser['id']);
//   //       if(valid){
//   //         isShowLoading.value=false;
//   //         Get.to(InputPhoneNumber());
//   //       }
//   //       else{
//   //         await loadUserData(phoneNumberExist);
//   //         Get.to(MenuMainScreen());
//   //       }
//   //       break;
//   //     case FacebookLoginStatus.cancelledByUser:
//   //       break;
//   //     case FacebookLoginStatus.error:
//   //       break;
//   //   }
//   // }

//   // Future<bool> checkFBIdExistOrNot(String facebookId) async{
//   //   isShowLoading.value=true;
//   //   final QuerySnapshot result = await FirebaseHelper.fireStoreReference.collection(Constants.USER_COLLECTION).where('facebookId',isEqualTo: facebookId).limit(1).get();
//   //   var docs=result.docs.length;
//   //   if(docs > 0) {
//   //     result.docs.forEach((DocumentSnapshot snap) {
//   //       phoneNumberExist=snap.id;
//   //     });
//   //     isShowLoading.value=false;
//   //     return false;
//   //   }
//   //   else{
//   //     isShowLoading.value=false;
//   //     return true;
//   //   }
//   // }

//   /// Slide up animation controller
//   //AnimationController formController;
// }
