import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:learningapp/Screens/HomeScreen/homscreen.dart';
import 'package:learningapp/Screens/LoginandRegisterScreen/forgotPasswordScreen.dart';
import 'package:learningapp/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
   postData(BuildContext ctx) async {
    var response =await http.post(Uri.parse('${LOGIN_URL}login.php'),
        body: {
          "email" : _emailController.text,
          "password" : _passwordController.text,
        });
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    if(jsonData['message'] == "true"){
      final _sharedprfs = await SharedPreferences.getInstance();
      _sharedprfs.setString('id', jsonData['id']);
      _sharedprfs.setBool("login", true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => (HomeScreen())));
    }
    else{
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          content: Text("Username and password does not match")));
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(color: Colors.black,
          icon:  Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Column(
            children: [
                    Text(
                      "Welcome back!",
                      style: TextStyle(
                          color: dcolor,
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Enter your email to sign in to your account",
                      style: TextStyle(
                          fontSize: 12),
                    ),
            ],
          ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "is Empty";
                              }
                              return null;
                            },
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Email'
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "is Empty";
                              }
                              return null;
                            },
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                hintText: 'Password'
                            ),
                          ),
                          TextButton(
                              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen())),
                              child: Text("Forgot Password?",style: TextStyle(color: Colors.red),)),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize:  Size(240, 40),
                              primary: dcolor
                            ),
                              onPressed: (){
                                if(_formkey.currentState!.validate()){
                                  postData(context);
                                }
                              },
                              child: Text('Sign in'))
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight*0.43,),
                    Column(
                      children: [
                        Text("By clicking on \"Sign in\" you agree to our",style: TextStyle(fontSize: 12)),
                        Text('Terms and privacy statements.',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
