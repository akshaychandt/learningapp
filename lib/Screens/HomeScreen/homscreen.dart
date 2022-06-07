import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learningapp/Model/homePageModel.dart';
import 'package:learningapp/Screens/HomeScreen/Components/bottonNav.dart';
// import 'package:http/http.dart' as http;
import 'package:learningapp/utils/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future<List<HomePageModel>> _getProduct() async {
  //   var data = await http.get(Uri.parse("${BASE_URL}view_product.php"));
  //   List jsonData = jsonDecode(data.body);
  //   List<Color> colors = [
  //     Color(0xFF3D82AE),
  //     Color(0xFFD3A984),
  //     Color(0xFF989493)
  //   ];
  //   int item = 0;
  //   List<HomePageModel> products = jsonData
  //       .map<HomePageModel>((json) => HomePageModel.fromJson(
  //       // json, item != colors.last ? colors[item++] : colors[item = 0]))
  //       .toList();
  //   // print(jsonData.first['product_name']);
  //   return products;
  // }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: SingleChildScrollView(
        child: Container(
          height:250 ,
          width: screenWidth,
          decoration: BoxDecoration(image: DecorationImage(
              image: NetworkImage('https://media.istockphoto.com/photos/vintage-retro-grungy-background-design-and-pattern-texture-picture-id656453072?k=20&m=656453072&s=612x612&w=0&h=txuUmEpOZqegdZuQw8ibPeopn3oHW6kmpKZZAChvZjY=',),
              fit: BoxFit.cover
          )),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                TextButton.icon(icon: Icon(Icons.arrow_forward_rounded),label: Text("Get Started"),
                onPressed: (){},),],
            ),
          ),
        ),
      ),

    );
  }

}
