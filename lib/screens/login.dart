import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircut/provider/authserv.dart';
import 'package:haircut/screens/otp.dart';
import 'package:lottie/lottie.dart';

class Loginp extends StatefulWidget {
  const Loginp({super.key});

  @override
  State<Loginp> createState() => _LoginpState();
}

class _LoginpState extends State<Loginp> {
  TextEditingController phonen = TextEditingController();

  Country coun = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

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
                      'https://lottie.host/e8e03464-6e37-4286-bd67-2031df952b2f/NoycLQ9MEl.json',
                      height: 450,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: phonen,
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                showCountryPicker(
                                    countryListTheme:
                                        const CountryListThemeData(
                                      bottomSheetHeight: 260,
                                    ),
                                    context: context,
                                    onSelect: (value) {
                                      setState(() {
                                        coun = value;
                                      });
                                    });
                              },
                              child: Text(
                                  " ${coun.flagEmoji} + ${coun.phoneCode} "),
                            ),
                          ),
                          hintText: "Enter Mobile Number",
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
                    const SizedBox(
                      height: 26,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String phone = "+${coun.phoneCode + phonen.text}";
                        AuthService.sentOtp(
                            phone: phone,
                            errorStep: () {},
                            nextStep: () {
                              Get.to(() => const Otpscreen());
                            });
                      },
                      child: const Text("Next"),
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
