import 'dart:js';

import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginTela extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(),
          senhaField(),
          Container(
            margin: const EdgeInsets.only(top : 12.0),
            child: Row(
              children: [
                Expanded(
                  child: submitedButton()
                )
              ],
            ),
          ),
        ]
      ),
    ); 
  }

  Widget emailField(){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, AsyncSnapshot<String> snapshot){
        return TextField(
          onChanged: (newValue) => bloc.changeEmail(newValue),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'seu@email.com',
            labelText: 'digite seu email',
            errorText: snapshot.hasError ? snapshot.error.toString() : null
          ),
        );
      },
    );
  }

  Widget senhaField(){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, AsyncSnapshot<String> snapshot){
        return TextField(
          onChanged: (newValue) => bloc.changePassword(newValue),
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'senha',
            labelText: 'digite sua senha',
            errorText: snapshot.hasError ? snapshot.error.toString() : null
          ),
        );
      }
    );
  }

  Widget submitedButton(){
    return ElevatedButton(
      onPressed: (){}, 
      child: const Text('Login :D')
      );
  }

}

