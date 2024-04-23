import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: () {
                print('Container tapped');
                login(emailController.text.toString(), passwordController.text.toString());
              },

              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text('Sign In'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void login(String email, String password) async {
    try {
      Response response = await post(Uri.parse('http://10.48.5.175:5000/api/v1/auth/login'), body: {
        'email': email,
        'password': password,

        // https://blogs-api-ebon.vercel.app/api/v1/auth/login
        // https://blogs-api-ebon.vercel.app/api/v1/auth/login

        // https://reqres.in/api/login
        // http://10.48.5.175:5000/api/v1/auth/login

      });
      if (response.statusCode == 200) {
        print('Login successful');
      } else {
        print('Login failed with status code: ${response.statusCode}');
        // Show an error message to the user
      }
    } catch (error) {
      print('Error during login: $error');
      // Show an error message to the user indicating network or server error
    }
  }
}
