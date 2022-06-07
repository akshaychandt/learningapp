import 'package:flutter/material.dart';
import 'package:learningapp/utils/constant.dart';

class ChangePaswordScreen extends StatefulWidget {
  const ChangePaswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePaswordScreen> createState() => _ChangePaswordScreenState();
}

class _ChangePaswordScreenState extends State<ChangePaswordScreen> {
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
                Text(
                  "Change Password",
                  style: TextStyle(
                      color: dcolor,
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Current Password'
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'New Password'
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Confirm  New Password'
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize:  Size(240, 40),
                            primary: dcolor
                          ),
                          onPressed: (){},
                          child: Text('Sign in'))
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
