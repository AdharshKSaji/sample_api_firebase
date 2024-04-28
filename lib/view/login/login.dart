
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_api_firebase/controller/logincontroller.dart';
import 'package:sample_api_firebase/view/homepage/homescreen.dart';
import 'package:sample_api_firebase/view/login/registration.dart.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    var formKey = GlobalKey<FormState>();
      
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                   
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: "  NAME",
                          // hintStyle: TextStyle(color: Colors.white),
                          labelText: " USER NAME",
                          // labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                     
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                          hintText: "PASSWORD",
                          // hintStyle: TextStyle(color: Colors.white),
                          labelText: "PASSWORD",
                          // labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                     
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: () async {
                  if (nameController.text.isNotEmpty &&
                      passwordcontroller.text.isNotEmpty) {
                    // registration funciton
                    context
                        .read<LoginScreenController>()
                        .onLogin(
                            context: context,
                            email: nameController.text,
                            password: passwordcontroller.text)
                        .then((value) {
                      if (value == true) {
                        // login success
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Text("Login Successs")));
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (route) => false);
                      } else {
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //     backgroundColor: Colors.red,
                        //     content: Text("Registration Failed")));
                      }
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Enter a valid email and password")));
                  }
                },
                child: Text("Login")),
            SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Dont have account"),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registeration(),
                          ));
                    },
                    child: Text("Register")),
              ],
            )
          ],
        ),
      ),
    );
  }
}