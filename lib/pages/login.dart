import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/warriors.png"),
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
          color: foregroundColor,
          fontSize: 21,
        ),
      ),
    );
  }
}

// For Text Change Animation
// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: <Widget>[
//     const SizedBox(width: 20.0, height: 100.0),
//     const Text(
//       'Be',
//       style: TextStyle(fontSize: 43.0),
//     ),
//     const SizedBox(width: 20.0, height: 100.0),
//     DefaultTextStyle(
//       style: const TextStyle(
//         fontSize: 40.0,
//         fontFamily: 'Horizon',
//       ),
//       child: AnimatedTextKit(
//         animatedTexts: [
//           RotateAnimatedText('AWESOME'),
//           RotateAnimatedText('OPTIMISTIC'),
//           RotateAnimatedText('DIFFERENT'),
//         ]
//         onTap: () {
//           print("Tap Event");
//         },
//       ),
//     ),
//   ],
// );
