import 'package:email_validator/email_validator.dart';

import '../../styles.dart';
import 'package:flutter/material.dart';

@override
void initState() {}

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailAddress = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 40, left: 20, right: 30),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/login_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 22.0,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Login",
                          style: loginTopicStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Form(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10, top: 30),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, top: 5),
                                    child: Image.asset(
                                      "assets/at-sign.png",
                                      scale: 4.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) =>
                                          EmailValidator.validate(value!)
                                              ? null
                                              : "Please enter a valid email",
                                      cursorColor: Colors.white,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        hintStyle: hintStyle,
                                        hintText: 'Email',
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10, top: 30),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, top: 5),
                                    child: Image.asset(
                                      "assets/lock.png",
                                      scale: 4.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) => value == ""
                                          ? null
                                          : "Please enter password",
                                      cursorColor: Colors.white,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      obscureText: isPasswordVisible,
                                      decoration: InputDecoration(
                                        hintStyle: hintStyle,
                                        hintText: 'Password',
                                        suffixIcon: IconButton(
                                          onPressed: visibilityToggle,
                                          icon: Icon(
                                            isPasswordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                        ),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(top: 10),
                        child: const Text(
                          "Forgot password?",
                          style: hintStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 60,
                  height: MediaQuery.of(context).size.height / 20,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(255, 17, 74, 1),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: const BorderSide(
                                      color: Color.fromRGBO(255, 17, 74, 1),
                                    )))),
                    child: const Text('Login'),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 200),
                    child: RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "New to us? ",
                            style: hintStyle,
                          ),
                          TextSpan(
                            text: " Sign up",
                            style: underlineStyle,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  visibilityToggle() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
}
