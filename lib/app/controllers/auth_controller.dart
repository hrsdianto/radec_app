import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:radec_app/app/routes/app_pages.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  // login controller
  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: "Verification Email",
          middleText: "Kamu perlu verifikasi email terlebih dahulu.",
          onConfirm: () async {
            await myUser.user!.sendEmailVerification();
            Get.back();
          },
          textConfirm: "Kirim Ulang",
          textCancel: "Kembali",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email');
        Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "No user found for that email",
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user');
        Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "Wrong password provided for that user",
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak dapat login dengan akun ini.",
      );
    }
  }

  // signup controller
  void signup(
      String uname, String email, String password, String ulevel) async {
    try {
      UserCredential myUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //User? uid = myUser.user;
      DatabaseReference userRef =
          FirebaseDatabase.instance.reference().child('users');
      String uid = myUser.user!.uid;
      //int dt = DateTime.now().millisecondsSinceEpoch;
      await userRef.child(uid).set({
        'uid': uid,
        'fullName': uname,
        'email': email,
        'level': ulevel,
      });

      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
        title: "Verification Email",
        middleText: "Kami telah mengirimkan email verifikasi ke $email.",
        onConfirm: () {
          Get.back(); //close dialog
          Get.back(); //close signup
        },
        textConfirm: "Ya, Saya akan cek email.",
      );
      //Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is to weak.');
        Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "he password provided is to weak.",
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already axists for that email');
        Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "The account already axists for that email",
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak dapat mendaftarkan akun ini",
      );
    }
  }

  // logout controller
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
