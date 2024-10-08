import 'package:flutter/material.dart';
import 'package:bookstore/components/my_textfield.dart';
import 'package:bookstore/components/my_button.dart';
import 'package:bookstore/services/auth/auth_service.dart';
class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //login method
  void login() async {
    final _authService = AuthService();
    //try sign in
    try {
      await _authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    }
    catch (e) {
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text(e.toString()),
            ),
      );
    }
  }

  //forgot pass
  void forgotPw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("User tapped forgot password"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //logo
              Image.asset('lib/images/logo/gemini.png',width: 350,height: 350,),
              Text(
                'Shop Your Favourite Read!',
                style: TextStyle(
                  fontSize: 22,            // Set the font size
                  fontWeight: FontWeight.bold,  // Set the font weight
                  color: Colors.black,       // Set the text color
                  //fontStyle: FontStyle.italic,  // Italicize the text
                  letterSpacing: 2.0,       // Set letter spacing
                  shadows: [
                    Shadow(                 // Add a shadow to the text
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
          
              SizedBox(height: 20),
              //app slogan
              Text(
                "Sign In to continue",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[800],fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              //email textfield
              MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),
              SizedBox(height: 25),
              //password textfield
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              SizedBox(height: 25),
              //sign in button
              MyButton(text: "Sign In",
                  onTap: login,
              ),
              SizedBox(height: 25),
              //not a member register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member?",
                        style: TextStyle(
                          color: Colors.grey[800], fontSize: 17),
                        ),
                  SizedBox(width: 4,),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text("Register now",
                      style: TextStyle(
                          color: Colors.grey[800],fontSize: 17,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
