import 'package:flutter/material.dart';
import 'package:support_plant/core/constants/constant.dart';
import 'package:support_plant/core/data_provider/local/cache_helper.dart';

import 'core/data_provider/remote/dio_helper.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  final formkey=GlobalKey<FormState>();

  @override
  void initState() {
    DioHelper.init();
    CacheHelper.init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
              children: [
                
                TextFormField(
                  controller: emailcontroller,
                  decoration:const InputDecoration(
                    border:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'email'
                  ),
                  validator: (value){
                    if(value==null||value.isEmpty) {
                      return 'Enter your email';
                    }
                  },
                ),
                const SizedBox(height: 20.0,),
                TextFormField(
                  controller: passwordcontroller,
                  decoration:const InputDecoration(
                    border:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    labelText: 'password'
                  ),
                  validator: (value){
                    if(value==null||value.isEmpty) {
                      return 'Enter your password';
                    }
                  },
                ),
                ElevatedButton(onPressed: ()async{
                  if(formkey.currentState!.validate()){
                    
                    await DioHelper.postData(endpoint: SIGNIN,body: {
                      "email": emailcontroller.text.toString(),
                      "password": passwordcontroller.text.toString()
                    }).then((value) {
                      CacheHelper.putData(ACCESSTOKEN, value?.data['data']['accessToken']);});
                  }
                }, child:const Text("Sign in"))
              ],
          ),
            )),
        )
        ),
    );
  }
}