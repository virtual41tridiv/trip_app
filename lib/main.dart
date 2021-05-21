import 'package:flutter/material.dart';
import 'package:trip_app/FadeAnimation.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Nunito'),
    home: HomePage(),
  )
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  PageController _pageController;
  int totalPage = 4;

  void _onScroll() {
    print('sss');
  }
  
  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    super.initState();
  }

@override
void dispose() {
  _pageController.dispose();
  super.dispose();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            image: 'assets/images/one.jpg',
          title: 'Golden Valley',
          description: 'The Golden wheel is a suspension of the GOLDEN GATE',
          ),
          makePage(
            page: 2,
            image: 'assets/images/two.jpg',
          title: 'Yosemite National Park',
          description: 'Yosemite National Park is in California',
          ),
          makePage(
            page: 3,
            image: 'assets/images/three.jpg',
          title: 'Jersulaem',
          description: 'Jersulaem describes the beauty of the city',
          ),
          makePage(
            page: 4,
            image: 'assets/images/four.jpg',
          title: 'Golden Beach',
          description: 'It is famous for its beautiful beaches',
          ),
        ],
      ),
      
    );
  }

 Widget makePage({image,title,description,page}) {
  
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          stops: [0.3,0.9],
          colors: [
            Colors.black.withOpacity(0.9),
            Colors.black.withOpacity(0.2),
          ]
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              FadeAnimation(2, Text(page.toString(), style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
              Text('/' + totalPage.toString(), style: TextStyle(color: Colors.white,fontSize: 15,),)
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(1,
                Text(title, style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 20,
                ),
               FadeAnimation(1.5, Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 3),
                      child: Icon(Icons.star, color: Colors.yellow,size: 15,),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 3),
                      child: Icon(Icons.star, color: Colors.yellow,size: 15,),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 3),
                      child: Icon(Icons.star, color: Colors.yellow,size: 15,),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 3),
                      child: Icon(Icons.star, color: Colors.yellow,size: 15,),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Icon(Icons.star, color: Colors.grey,size: 15,),
                    ),
                    Text('4.0', style: TextStyle(color: Colors.white70),),
                Text('(2300)', style: TextStyle(color: Colors.white70,fontSize: 12,),),
                  ],
                )),
                SizedBox(
                  height: 20,
                ),
               FadeAnimation(2, Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text(description, style: TextStyle(color:Colors.white.withOpacity(.7),height:1.9),),
               )),
                SizedBox(height: 20,),
               FadeAnimation(2.5,Text('READ MORE', style: TextStyle(color: Colors.white),)),
                SizedBox(height: 30,),
              ],
            ), 
            ),
          ],
        ), 
        ),
    ),
  );

 }

}