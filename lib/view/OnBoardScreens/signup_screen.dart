import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_shopping_app/res/constant/app_strings.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../res/common/app_button.dart';
import '../../res/common/app_text_feild.dart';
import 'login_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool visiblePassword = false;
  bool visibleConfirmPassword = false;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? userCredential;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Color(0xFFBDBDBD),
                          thickness: 1,
                          endIndent: 15,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.height / 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.fromBorderSide(
                              BorderSide(color: Colors.black)),
                        ),
                        child: Image.asset(AppImages.logo),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Color(0xFFBDBDBD),
                          thickness: 1,
                          indent: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  const Text(
                    "WELCOME",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                        color: Color(0xFF242424)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color(0x338A959E),
                            spreadRadius: 0,
                            blurRadius: 30,
                            offset: Offset(0, 8))
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFE0E0E0)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: TextFieldScreen(
                              controller: nameController,
                              textInputAction: TextInputAction.next,
                              labelText: "Name",
                              labelStyle:
                                  const TextStyle(color: Colors.blueGrey),
                              hidePassword: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: 20,
                                    color: Color(0xFF242424),
                                  )),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFE0E0E0)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: TextFieldScreen(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              labelText: "Email",
                              labelStyle:
                                  const TextStyle(color: Colors.blueGrey),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFE0E0E0)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: TextFieldScreen(
                              controller: passwordController,
                              textInputAction: TextInputAction.next,
                              labelText: "Password",
                              labelStyle:
                                  const TextStyle(color: Colors.blueGrey),
                              hidePassword: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visiblePassword = !visiblePassword;
                                  });
                                },
                                icon: Icon(
                                  visiblePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 15,
                                  color: const Color(0xFF242424),
                                ),
                              ),
                              obscureText: !visiblePassword,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFE0E0E0)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: TextFieldScreen(
                              controller: confirmPasswordController,
                              textInputAction: TextInputAction.done,
                              labelText: "Confirm Password",
                              labelStyle:
                                  const TextStyle(color: Colors.blueGrey),
                              hidePassword: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visibleConfirmPassword =
                                        !visibleConfirmPassword;
                                  });
                                },
                                icon: Icon(
                                  visibleConfirmPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 15,
                                  color: const Color(0xFF242424),
                                ),
                              ),
                              obscureText: !visibleConfirmPassword,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.04),
                          GestureDetector(
                            onTap: () {
                              if (validator()) {
                                debugPrint("Every thing is Good!");
                              } else {
                                signupUser();
                              }
                            },
                            child: AppButton(
                              height: MediaQuery.of(context).size.height / 14,
                              width: MediaQuery.of(context).size.width / 1,
                              title: "Sign up",
                              fontSize: 16,
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have account?",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xFF909090)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LogInPage(),
                                      ));
                                },
                                child: const Text(
                                  " Sign in",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Color(0xFF303030)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  signInWithGoogle();
                                },
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: const Color(0x80000000))),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Image(
                                      image: AssetImage(AppImages.google),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color(0x80000000))),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image(
                                    image: AssetImage(AppImages.apple),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showToastMessage(message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white38,
      textColor: Colors.black26,
      fontSize: 14,
    );
  }

  bool validator() {
    if (nameController.text.isEmpty) {
      showToastMessage("Please enter Name");
      return false;
    } else if (!RegExp('[a-zA-Z]').hasMatch(nameController.text)) {
      showToastMessage("Please enter correct Name");
      return false;
    } else if (emailController.text.isEmpty) {
      showToastMessage("Please enter email");
      return false;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) {
      showToastMessage("Please enter valid email");
      return false;
    } else if (passwordController.text.isEmpty) {
      showToastMessage("Please enter Referral code");
      return false;
    } else if (!RegExp(
            "^(?=.*[A-Z].*[A-Z])(?=.*[!@#\$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}")
        .hasMatch(passwordController.text)) {
      showToastMessage("Please enter Referral code");
      return false;
    } else if (confirmPasswordController.text.isEmpty) {
      showToastMessage("Please enter password");
      return false;
    } else if (!RegExp(
            "^(?=.*[A-Z].*[A-Z])(?=.*[!@#\$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}")
        .hasMatch(confirmPasswordController.text)) {
      showToastMessage("Please enter valid password");
    } else {
      return false;
    }
    return true;
  }

  signupUser() async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        debugPrint("User Data --> ${value.user}");
        userCredential = value.user;
        value.user!.sendEmailVerification();
        setState(() {});
      });
    } on FirebaseAuthException catch (error) {
      showToastMessage(error.message);
      showToastMessage(error.code);
      debugPrint(error.message);
      debugPrint(error.code);
    }
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
