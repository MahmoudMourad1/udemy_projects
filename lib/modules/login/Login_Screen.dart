import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController= TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(

        title: Text(
          'Login',
          style: TextStyle(

          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(40.0),
                child:

                Container(
                  

                  child: Text('Login',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),

                  ),
                ),
              ),
              SizedBox(
                height: 40.0,

              ),
              TextFormField(
                controller: emailController,
                onFieldSubmitted: (String value){
                  print(value);
                },
                onChanged: (String value){
                  print(value);
                },
                validator: ( value) {
                  if (value!.isEmpty) {
                    return "Email can't be empty";
                  }
                  return null;
                },
                //علشان نخلي الكيبورد يبقي فيه علامه @ بتاعت الايميل
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  border: OutlineInputBorder(),
                ),


              ),
              SizedBox(
                height: 10.0,

              ),
              defaultFormField(controller: emailController,
                  type: TextInputType.emailAddress,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Email can't be empty";
                    }
                    return null;
                  },
                  label: 'Email Address',
                  prefix: Icons.email
              ),

              SizedBox(
                height: 20.0,
              ),
              defaultButton(
                width: double.infinity,
                background: Colors.blue,
                text: 'Login',
                radius: 5.0,
                function:(){
                  formKey.currentState?.validate();


                },


              ),


            ],
          ),
        ),
      ),
    );
  }
}
