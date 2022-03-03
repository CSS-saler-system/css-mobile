// import 'package:bee/helper/firebase_helper.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import '../constants.dart';

// class AuthHelper {
//   static Function? onVerificationCompleted;
//   static Function? onNewUser;
//   static Function? onCodeSent;
//   static String? finalVerificationId;
//   static final FirebaseAuth auth = FirebaseAuth.instance;
//   static Function? checkErrorBlockUser;
//   static Function? showAutoVerify;

//   static final PhoneVerificationCompleted verificationCompleted =
//       (AuthCredential phoneAuthCredential) {
//     auth.signInWithCredential(phoneAuthCredential).then((data) {
//       FirebaseHelper.fireStoreReference
//           .collection(Constants.USER_COLLECTION)
//           .doc(data.user?.phoneNumber)
//           .get()
//           .then((doc) {
//         if (doc.exists) {
//           showAutoVerify!();
//           Future.delayed(Duration(seconds: 1), () {
//             onVerificationCompleted!(data.user!.phoneNumber);
//           });
//         } else {
//           showAutoVerify!();
//           Future.delayed(Duration(milliseconds: 1), () {
//             onNewUser!(data);
//           });
//         }
//       }).catchError((err) => print('err'));

//       return data;
//     }).catchError((e) {
//       checkErrorBlockUser!(e.message);
//     });
//   };

//   // ignore: unnecessary_cast
//   static final PhoneVerificationFailed verificationFailed =
//       (FirebaseAuthException authException) {
//     checkErrorBlockUser!(authException.message.toString());
//     return authException.message;
//   } as PhoneVerificationFailed;

//   // ignore: unnecessary_cast
//   static final PhoneCodeSent codeSent =
//       (String verificationId, [int? forceResendingToken]) async {
//     finalVerificationId = verificationId;
//     onCodeSent!();
//     return verificationId;
//   } as PhoneCodeSent;

//   // ignore: unnecessary_cast
//   static final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//       (String verificationId) {
//     finalVerificationId = verificationId;
//     return verificationId;
//   } as PhoneCodeAutoRetrievalTimeout;

//   static Future verifyPhoneNumber(String phoneNumber) async {
//     await auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         timeout: const Duration(minutes: 2),
//         verificationCompleted: verificationCompleted,
//         verificationFailed: verificationFailed,
//         codeSent: codeSent,
//         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//   }
// }
