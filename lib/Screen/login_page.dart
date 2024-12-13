import 'package:flutter/material.dart';
import 'package:coffee_shop_app/Screen/custom_clipper.dart';
import 'package:coffee_shop_app/Screen/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

late TextEditingController userController;
late TextEditingController passwordController;

@override
  void initState() {
    userController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

@override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.7,
              width: double.infinity,
              child: _buildInputFields(),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildInputFields() {
    return ClipPath(
      clipper: CustomClipperWidget(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 11, 172, 105),
              Colors.transparent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                "Whats Our Menu?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 60),
              _buildTextFields(userController,Icons.person_outline, "username"),
              const SizedBox(height: 20),
              _buildTextFields(passwordController,Icons.info_outline, "password",
              isPassword: true),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>HomePage(
              )));
                },
                child:const Text("LOGIN"),
                ),
            ],
          ),
          ),
      ),
    );
  }


  Widget _buildTextFields (TextEditingController controller, IconData icon, String hint,
  {bool isPassword = false}) {
  return TextField(
    controller: controller,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white),
      prefixIcon: Icon(
        icon,
        color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.transparent,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
    ),
    obscureText: isPassword,
  );
  }
}