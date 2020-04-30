import 'package:busy_time/components/custom_search_delagate.dart';
import 'package:busy_time/controllers/home_controller.dart';
import 'package:busy_time/models/content_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController scrollController = ScrollController();
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    //Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      //appBar: AppBar(title: Text("Busy Time")),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepPurple,
        onPressed: () async {
          _controller.query = await showSearch(
            context: context,
            delegate: CustomSearchDelagate(hintText: 'Series or Movies'),
          );

          await _controller.getContent();
        },
      ),
      body: Container(
        //color: Colors.grey,
        //height: 520,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 56, 0, 16),
              child: Text(
                "Series",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ),
            Expanded(
              child: Observer(
                builder: (context) {
                  return _controller.status
                      ? _controller.listContent == []
                          ? Center(
                              child: Text("Nenhum"),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.7,
                              ),
                              //shrinkWrap: true,
                              itemCount: _controller.listContent.length,
                              itemBuilder: (context, index) {
                                print(
                                    "item builder index: " + index.toString());
                                ContentModel model =
                                    _controller.listContent[index];
                                return Card(
                                  child: SizedBox(
                                      child: Image.network(model.posterPath)),
                                );
                              },
                            )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
