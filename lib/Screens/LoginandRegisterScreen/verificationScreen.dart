import 'package:flutter/material.dart';
import 'package:learningapp/utils/constant.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
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
            child: ListView(
              children: [
                Column(
                  children: [
                    Text(
                      "Verification",
                      style: TextStyle(
                          color: dcolor,
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Enter your",
                          style: TextStyle(
                              fontSize: 12),
                        ),
                        SizedBox(width: 3,),
                        Text(
                          "verification code",
                          style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 3,),
                        Text(
                          "we just sent you",
                          style: TextStyle(
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      "on your email address",
                      style: TextStyle(
                          fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTextField(),
                    buildTextField(),
                    buildTextField(),
                    buildTextField(),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Didn\'t receive a code?'),
                    TextButton(onPressed: (){}, child: Text('Resend Code',style: TextStyle(color: dcolor),))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                  child: Column(
                    children: [
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
   Row buildTextField(){
    return Row(
      children: [
        Container(
          height: 64.0,
          width: 56.0,
          child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              // controller: this.code,
              maxLength: 1,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                  counterText: '',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 20.0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey)
                ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blue)
                  )
              )
          ),
        ),
        SizedBox(width: 2,)
      ],
    );
  }
}
