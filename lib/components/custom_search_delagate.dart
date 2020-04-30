import 'package:flutter/material.dart';

class CustomSearchDelagate extends SearchDelegate<String>{

  CustomSearchDelagate({
       String hintText,
  }) : super(
      searchFieldLabel: hintText,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
    );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.black,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      primaryColorBrightness: Brightness.dark,
      primaryTextTheme: theme.textTheme,
    );
  }

  
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
        ), 
        onPressed: (){
          print("action: clear");
          query = "";
        }
      ),
    ];
  }
  
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
      ), 
      onPressed: (){
        print("action: arrow back");
        close(context, "");
      }
    );
  }
  
  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = List();
    suggestions = [
        "Suits", 
        "Peaky Blinders", 
        "Vikings", 
        "Titanic"
      ].where(
        (texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();

    if(query.isNotEmpty){
    
    
      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              close(context, suggestions[index]);
            },
            title: Text(suggestions[index]),
          );
        }
      );
    }else{
      return Column(
        //mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (context, index){
                return ListTile(
                leading: Icon(Icons.history),
                  onTap: (){
                    close(context, suggestions[index]);
                  },
                  title: Text(suggestions[index]),
                );
              }
            )
          ),  
        ]
      );
    }
  }
}