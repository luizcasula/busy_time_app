import 'package:busy_time/components/custom_search_delagate.dart';
import 'package:busy_time/controllers/home_controller.dart';
import 'package:busy_time/models/content_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Busy Time"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          String query = await showSearch(
            context: context,
            delegate: CustomSearchDelagate(hintText: 'Series or Movies'),
          );
          if (query != null) {
            setState((){
              _controller.status = false;
              _controller.getContent(query);
              _controller.status = true;
            });
            
            
          }
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          height: double.maxFinite,
          child: _controller.status
              ? _controller.listContent == null
                  ? Center(
                      child: Text("empty"),
                    )
                  : ListView.builder(
                      itemCount: _controller.listContent.length,
                      itemBuilder: (context, index) {
                        print("item builder index: " + index.toString());
                        ContentModel model = _controller.listContent[index];
                        return ListTile(
                          title: Text(model.name),
                        );
                      },
                    )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
