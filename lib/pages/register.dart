import 'package:bookstore/components/my_button.dart';
import 'package:bookstore/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/services/auth/auth_service.dart';
import 'package:bookstore/pages/home.dart';
class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordlController = TextEditingController();
  final TextEditingController confirmPasswordlController = TextEditingController();

  //register method
  void register() async {
    //get auth service
    final _authService = AuthService();

    //check if the pass matches, create user
    if (passwordlController.text == confirmPasswordlController.text) {
      //try creating user
      try {
        await _authService.signUpWithEmailPassword(
          emailController.text,
          passwordlController.text,
        );
        /*Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );*/
      }
      catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
        );
      }
    }

    // if the pass dont match, show error
    else{
      showDialog(
        context: context,
        builder: (context) =>const AlertDialog(
          title: Text("Password don't match!"),
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.lock_open_rounded, size: 100,
                color: Colors.grey[800],
              ),
              SizedBox(height: 25),
              //app slogan
              Text(
                "Let's create an account for you",
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
                controller: passwordlController,
                hintText: "Password",
                obscureText: true,
              ),
              SizedBox(height: 25),
              //confirm password textfield
              MyTextField(
                controller: confirmPasswordlController,
                hintText: "Confirm password",
                obscureText: true,
              ),
              SizedBox(height: 25),
              //sign up button
              MyButton(text: "Sign Up",
                  onTap: register,
              ),
              SizedBox(height: 25),
              //Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                    style: TextStyle(
                          color: Colors.grey[800], fontSize: 17),
                  ),
                  SizedBox(width: 4,),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text("Login now",
                      style: TextStyle(
                              color: Colors.grey[800], fontSize: 17,fontWeight: FontWeight.bold,
                    ),
                  ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
