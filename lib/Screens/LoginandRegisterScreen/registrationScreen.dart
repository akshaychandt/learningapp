import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learningapp/Screens/LoginandRegisterScreen/signinScreen.dart';
import 'package:learningapp/utils/constant.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  postData(BuildContext ctx) async{
    var response =await http.post(Uri.parse('${LOGIN_URL}registration.php'),
        body: {
          "name" : _nameController.text,
          "email" : _emailController.text,
          "country" : _countryController.text,
          "phone" : _phoneController.text,
          "password" : _passwordController.text,
        });
    print('response=${response.body}');
    var jsonData = jsonDecode(response.body);
    if(jsonData['message'] == "true") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SigninScreen()));
    }
    else{
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          content: Text("Please Check Your Connection")));
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
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
        child: SingleChildScrollView(
          child: Center(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text("Sign up",style: TextStyle(color: dcolor,fontSize: 28,fontWeight: FontWeight.w500),),
                        SizedBox(height: 20,),
                        Text('By using our services you are agreeing to our',style: TextStyle(fontSize: 12),),
                        Text('Terms and privacy statements.',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                      ],
                    ),
                    SizedBox(height: screenHeight*0.04,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "is Empty";
                              }
                              return null;
                            },
                            controller: _nameController,
                            decoration: InputDecoration(
                                hintText: 'Name'
                            ),
                          ),
                          SizedBox(height: screenHeight*0.02,),
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "is Empty";
                              }
                              if(!value.contains('@') || !value.contains('.')){
                                return "email is badly formated";
                              }
                              return null;
                            },
                            controller: _emailController,
                            decoration: InputDecoration(
                                hintText: 'Email'
                            ),
                          ),
                          SizedBox(height: screenHeight*0.02,),
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "is Empty";
                              }
                              return null;
                            },
                            controller: _countryController,
                            decoration: InputDecoration(
                                hintText: 'Country'
                            ),
                          ),
                          SizedBox(height: screenHeight*0.02,),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (value){
                              if(value!.isEmpty){
                                return "is Empty";
                              }
                              if(value.length>10 || value.length<10){
                                return "invalid";
                              }
                              return null;
                            },
                            controller: _phoneController,
                            decoration: InputDecoration(
                                hintText: 'Phone'
                            ),
                          ),
                          SizedBox(height: screenHeight*0.02,),
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "is Empty";
                              }
                              if(value.length<8){
                                return "Too short";
                              }
                              return null;
                            },
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                hintText: 'Password',
                            ),
                          ),
                          SizedBox(height: screenHeight*0.04,),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize:  Size(240, 40),
                                primary: dcolor,
                              ),
                              onPressed: (){
                                if(_formkey.currentState!.validate()){
                                  postData(context);
                                }
                              },
                              child: Text('Sign in')),
                          SizedBox(height: screenHeight*0.24,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?",),
                              TextButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>SigninScreen())),
                                  child: Text('Sign in',style: TextStyle(color: dcolor,fontWeight: FontWeight.w500),))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ),
        ),
      ),
    );
  }
}
