
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_api_firebase/controller/registrationcontroller.dart';
import 'package:sample_api_firebase/view/login/login.dart';


class Registeration extends StatefulWidget {
  const Registeration({super.key});

  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    var formKey = GlobalKey<FormState>();
      final providerobj = context.watch<RegistrationScreenController>();
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
                        'Registeration',
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
            providerobj.isLoading
                ? CircularProgressIndicator():
            OutlinedButton(
                 onPressed: () async {
                      if (nameController.text.isNotEmpty &&
                          passwordcontroller.text.isNotEmpty) {
                        // registration funciton
                        context
                            .read<RegistrationScreenController>()
                            .register(
                                context: context,
                                email: nameController.text,
                                password: passwordcontroller.text)
                            .then((value) {
                          if (value == true) {
                            // login success
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("Registration Successs")));
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
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
                    child: Text("Register")),
            SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Already have account"),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                    child: Text("Login now")),
              ],
            )
          ],
        ),
      ),
    );
  }
}