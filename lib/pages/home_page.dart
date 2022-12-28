import 'package:chiroyli_ui/pages/sign_up.dart';
import 'package:flutter/material.dart';

import '../servise/Hide_servise.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222434),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 150,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: (){},
                      child: Text("SIGN IN", style: TextStyle(color: Colors.white,  fontSize:18),),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const SignUp()
                            )
                        );
                      },
                      child: Text("SIGN UP", style: TextStyle(color: Colors.grey,  fontSize:18),),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.yellowAccent
              ),
                width: double.infinity,
                height: 5,
              ),
              SizedBox(height: 90,),
              TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.blue, fontSize: 23,),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person,color: Colors.white,),
                    hintText: "Email",
                    hintStyle: const TextStyle(fontSize: 20,color: Colors.grey),
                    border: InputBorder.none
                ),
                cursorRadius: const Radius.circular(4),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                width: double.infinity,
                height: 1,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: passwordController,
                style: const TextStyle(color: Colors.blue, fontSize: 23,),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.white,),
                    hintText: "Password",
                    hintStyle: const TextStyle(fontSize: 20,color: Colors.grey),
                    border: InputBorder.none
                ),
                cursorRadius: const Radius.circular(4),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                width: double.infinity,
                height: 1,
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextButton(
                          onPressed: (){}, child: Text("Forget Password",style: TextStyle(color: Colors.white),)))
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 100, left: 100),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.yellow
                ),
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed: (){
                    stringDB ();
                    stringDB1 ();
                  },
                  child: const Text("Sign IN", style: TextStyle(color: Colors.black),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    height: 30,
                    child: const Text("Or Login with", style: TextStyle(color: Colors.grey),),
                  ),
                  const SizedBox(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {  },
                    color: Colors.blue.shade900,
                    child: SizedBox(
                      height: 40,
                      width: 100,
                      child: Row(
                        children: const [
                          Icon(Icons.facebook_sharp, color: Colors.white,),
                          Text("Facebook", style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  MaterialButton(
                    onPressed: (){},
                    color: Colors.white,
                    child: SizedBox(
                      width: 100,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            radius: 10,
                            foregroundImage: AssetImage("assets/images/img.png"),
                          ),
                          SizedBox(width: 5,),
                          Text("Google", style: TextStyle(color: Colors.black),),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  void stringDB (){
    String name = "Email ${emailController.text}";
    HiveDB.storeString(name);
    String loadName = HiveDB.loadString();
    print(loadName);
  }
  void stringDB1 (){
    String name = "Password ${passwordController.text}";
    HiveDB.storeString(name);
    String loadName = HiveDB.loadString();
    print(loadName);
  }
  
}
