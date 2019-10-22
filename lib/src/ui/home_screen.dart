import 'package:flutter/material.dart';
import 'package:numbers_facts_app/src/blocs/bloc_provider.dart';
import 'package:numbers_facts_app/src/blocs/facts_bloc.dart';

class HomeScreen extends StatefulWidget{


  @override
  State createState() {
    return HomeScreenState();

  }
}


class HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {

    final _bloc = FactsBloc();


    Widget _showDialog(){
      return AlertDialog(
        title: Text("Error"),
        content: Text("Ha ocurrido un error. Verifique su conexion"),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Numbers Facts"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              Text("¡Escriba un número para obtener datos!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 25),
              Container(
                width: 200,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    hintText: "Ej: 20",
                  ),
                  onChanged: (input){
                    if(!input.isEmpty)
                      _bloc.getFacts(input);
                  },
                ),
              ),
              Container(
                child: StreamBuilder<String>(
                  initialData: "",
                  stream: _bloc.stream,
                  builder: (context, snapshot){

                    if(snapshot.hasError){
                      return _showDialog();
                    }
                    if(snapshot.connectionState == ConnectionState.waiting)
                      return CircularProgressIndicator();

                    if(snapshot.data.length == 0)
                      return Text("");

                    if(snapshot.hasData){
                      final facts = snapshot.data;
                      return Text(facts);
                    }

                    return CircularProgressIndicator();

                  },
                )
              ),
            ],
          ),
        ),
      ),
    );

  }
}