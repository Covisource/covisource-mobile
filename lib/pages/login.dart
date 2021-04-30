import 'package:covisource/components/auto_text_changer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<String> options = [
    "oxygen",
    "beds",
    "hospitals",
    "plasma",
    "remdesivir",
    "vaccines",
    "ventilators"
  ];
  String current = "oxygen";
  int index = 0;
  final Shader linearGradient =
      LinearGradient(colors: <Color>[Colors.lightBlue, Colors.blue])
          .createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/warriors.png", width: 275, height: 275),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your search for ",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                    ),
                  ),
                  AutoTextChanger(
                    text: options,
                    textChangeSec: 3,
                    animationDuration: 500,
                    textstyle: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linearGradient),
                    isAnimated: true,
                    initialtext: "resources",
                  ),
                ],
              ),
              Text(
                "ends here.",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 320,
                height: 65,
                child: AuthButton(
                  text: "Login With Google",
                  icon: FontAwesomeIcons.google,
                  backgroundColor: Color(0xFFF87171),
                  foregroundColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: 320,
                  height: 65,
                  // ignore: deprecated_member_use
                  child: AuthButton(
                    text: "Login With Twitter",
                    icon: FontAwesomeIcons.twitter,
                    backgroundColor: Color(0xFF60A5FA),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: 320,
                  height: 65,
                  // ignore: deprecated_member_use
                  child: AuthButton(
                    text: "Continue as Guest",
                    icon: FontAwesomeIcons.user,
                    backgroundColor: Color(0xFFE5E7EB),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Image.asset(
                    "assets/covisource.png",
                    width: 220,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;

  AuthButton({
    @required this.text,
    @required this.icon,
    @required this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: backgroundColor,
      onPressed: () {},
      icon: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Icon(
          icon,
          color: foregroundColor,
        ),
      ),
      label: Text(
        text,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: foregroundColor,
          fontSize: 21,
        ),
      ),
    );
  }
}
