import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learningapp/Screens/LoginandRegisterScreen/signinScreen.dart';
import 'package:learningapp/Screens/LoginandRegisterScreen/signupwithAuth.dart';
import 'package:learningapp/utils/constant.dart';

class SigninScreenAuth extends StatefulWidget {
  const SigninScreenAuth({Key? key}) : super(key: key);

  @override
  State<SigninScreenAuth> createState() => _SigninScreenAuthState();
}

class _SigninScreenAuthState extends State<SigninScreenAuth> {
  _google_Auth() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
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
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height:30,),
                  Text("Sign in",style: TextStyle(color: dcolor,fontSize: 28,fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  Text('By using our services you are agreeing to our',style: TextStyle(fontSize: 12),),
                  Text('Terms and Privacy statement.',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                ],
              ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SigninScreen()));
                              },
                              child: Padding(padding: EdgeInsets.symmetric(),
                                child: Container(
                                  // height: 70,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.alternate_email_outlined,size: 20,),
                                          SizedBox(width: 5,),
                                          Text('Sign In with Email',style: TextStyle(fontSize: 12),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            InkWell(
                              onTap: (){
                            _google_Auth();
                            },
                              child: Padding(padding: EdgeInsets.symmetric(),
                                child: Container(
                                  // height: 70,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.email,size: 20,),
                                          SizedBox(width: 5,),
                                          Text('Sign In with Google',style: TextStyle(fontSize: 12),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            InkWell(
                              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>SigninScreen())),
                              child: Padding(padding: EdgeInsets.symmetric(),
                                child: Container(
                                  // height: 70,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.facebook,size: 20,),
                                          SizedBox(width: 5,),
                                          Text('Sign In with FaceBook',style: TextStyle(fontSize: 12),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight*0.371),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("New here?"),
                            TextButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreenAuth())),
                                child: Text('Sign Up',style: TextStyle(color: dcolor,fontWeight: FontWeight.w500),))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
        ),
      ),
    );
  }
}
