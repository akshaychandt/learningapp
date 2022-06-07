import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.home_outlined,size: 35,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.slow_motion_video_rounded,size: 35,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.my_library_books_outlined,size: 35,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined,size: 35,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.person_outline_outlined,size: 35,)),
        ],
      ),
    );
  }
}
