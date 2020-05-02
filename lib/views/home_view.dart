import 'package:busy_time/components/custom_search_delagate.dart';
import 'package:busy_time/controllers/home_controller.dart';
import 'package:busy_time/models/serie_model.dart';
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
              delegate: CustomSearchDelagate(hintText: 'Search a Serie'),
            );
            await _controller.getContent();
          },
        ),
        body: Observer(builder: (_) {
          return _controller.status
              ? _controller.listContent.isEmpty
                  ? Center(
                      child: Text(
                        "Add your watched series",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w200),
                      ),
                    )
                  : CustomScrollView(
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 16, top: 72, bottom: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Observer(builder: (_) {
                                  return Text(
                                    _controller.timeWatched,
                                    style: TextStyle(fontSize: 48),
                                  );
                                }),
                                Text(
                                  "DAYS HOURS MINUTES",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.7,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              print("item builder index: " + index.toString());
                              SerieModel model =
                                  _controller.listContent[index];
                              return Stack(
                                children: <Widget>[
                                  Card(
                                    child: SizedBox(
                                      child: Image.network(model.posterPath),
                                    ),
                                  ),
                                ],
                              );
                            },
                            childCount: _controller.listContent.length,
                          ),
                        ),
                      ],
                    )
              : Center(
                  child: CircularProgressIndicator(),
                );
        }));
  }
}
