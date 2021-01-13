import 'package:flutter/material.dart';
import 'package:signin_flutter_ui/Animation/FadeAnimation.dart';
import 'package:signin_flutter_ui/configuration.dart';
import 'package:signin_flutter_ui/sign_up.dart';
import 'package:signin_flutter_ui/sing_in.dart';
// import 'package:signin_flutter_ui/constants.dart';
import 'package:signin_flutter_ui/splash_content.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}



class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Bring together your files, your tools\nProjects and people. including a new\n mobile and desktop application",
      "image": "assets/images/collaborators_prrw.png"
    },
    {
      "text":
      "Bring together your files, your tools\nProjects and people. including a new\n mobile and desktop application",
      "image": "assets/images/online_connection.png"
    },
    {
      "text": "Bring together your files, your tools\nProjects and people. including a new\n mobile and desktop application",
      "image": "assets/images/remote_meeting.png"
    },
    {
      "text": "Bring together your files, your tools\nProjects and people. including a new\n mobile and desktop application",
      "image": "assets/images/sharing_articles.png"
    }

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: SizedBox(
        width: double.infinity,


        child: Column(
          children: <Widget>[

            Expanded(
              flex: 5,
              child: PageView.builder(

                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],

                ),

              ),

            ),

            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(flex: 3),

                    FadeAnimation(1.6,Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                            (index) => buildDot(index: index),
                      ),
                    ),),


                    Spacer(),


                    FadeAnimation(1.6,  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Container(
                              height: 50,
                              width: 150,


                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff3b3a42)
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => SignIn()),);
                                },
                                child: Center(
                                  child: Text("SIGN IN", style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              )
                          ),

                          SizedBox(width: 5,),

                          Container(
                              height: 50,
                              width: 150,


                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffF3C179)
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => SignUp()),);
                                },
                                child: Center(
                                  child: Text("SIGN UP", style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              )
                          ),

                        ],
                      ),
                    ),),





                    Spacer(),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xffF3C179) : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class SplahButton extends StatelessWidget {
  const SplahButton({
    Key key,
    this.text,
    this.press,

  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(60),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        // color: Color(0xFFF27E63),
        // color: Colors.black,
        color: Color(0xff3C8590),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
