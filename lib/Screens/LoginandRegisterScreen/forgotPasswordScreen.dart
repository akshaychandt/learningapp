import 'package:flutter/material.dart';
import 'package:learningapp/utils/constant.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(color: Colors.black,
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: dcolor,
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Enter your email address associated with",
                      style: TextStyle(
                          fontSize: 12),
                    ),
                    Text(
                      "your account.We will email you a",
                      style: TextStyle(
                          fontSize: 12),
                    ),
                    Text(
                      "verification code",
                      style: TextStyle(
                          fontSize: 12,fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Email'
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize:  Size(240, 40),
                            primary: dcolor
                          ),
                          onPressed: (){},
                          child: Text('Send'))
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
