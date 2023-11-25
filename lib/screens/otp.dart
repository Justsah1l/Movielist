import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircut/provider/authserv.dart';
import 'package:haircut/screens/home.dart';
import 'package:lottie/lottie.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 26, horizontal: 10),
                child: Column(
                  children: [
                    LottieBuilder.network(
                      'https://lottie.host/3c9b2d29-47a9-4ee2-b8b9-8f0776b3741f/YKH5KheYYL.json',
                      height: 450,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: otp,
                        decoration: InputDecoration(
                          hintText: "Enter OTP",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    /*Text(
                      "Enter OTP ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 26, horizontal: 15),
                      child: Pinput(
                        controller: otp,
                        length: 6,
                        onSubmitted: (value) async {
                          print("submitted");
                          try {
                            await FirebaseAuth.instance
                                .signInWithCredential(
                                    PhoneAuthProvider.credential(
                                        verificationId: widget.verificationId,
                                        smsCode: value))
                                .then((value) async {
                              if (value.user != null) {
                                Get.to(() => Homepage());
                              }
                            });
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          }
                        },
                      ),
                    ),*/
                    const SizedBox(
                      height: 26,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AuthService.loginWithOtp(otp: otp.text).then((value) {
                          if (value == "Success") {
                            Get.to(() => const Homepage());
                          }
                        });
                      },
                      child: const Text("Get Started"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        onPrimary: Colors.white,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        fixedSize: const Size(260, 60),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
