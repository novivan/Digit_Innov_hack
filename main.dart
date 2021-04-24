import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(10.0), child: new Form(key: _formKey, child: new Column(children: <Widget>[
      new Text('Введите номер автомобиля:', style: TextStyle(fontSize: 20.0),),
      new TextFormField(validator: (value){
        if (value.isEmpty) return 'Неверный формат ввода';
      }),

      new SizedBox(height: 20.0),

      new RaisedButton(onPressed: (){
        if(_formKey.currentState.validate()) Scaffold.of(context).showSnackBar(SnackBar(content: Text('Форма успешно заполнена'), backgroundColor: Colors.green,));
      }, child: Text('Войти'), color: Colors.blue, textColor: Colors.white,),
    ],)));
  }
}

void main() => runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(title: new Text('Вход')),
            body: new MyForm()
        )
    )
);