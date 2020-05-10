import 'package:busy_time/components/custom_search_delagate.dart';
import 'package:busy_time/controllers/home_controller.dart';
import 'package:busy_time/models/serie_model.dart';
import 'package:flutter/cupertino.dart';
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
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Observer(builder: (_) {
              return IconButton(
                icon: Icon(Icons.delete),
                color: Colors.white,
                onPressed: _controller.changeRemoveStatus,
              );
            }),
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
          //TODO: add computed in controller to show dialog
          await _controller.getSerie();
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(_controller.query,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          )),
                      Container(
                        height: 300,
                        width: 300,
                        child: CupertinoPicker.builder(
                          backgroundColor: Colors.black.withOpacity(0),
                          itemExtent: 50,
                          childCount: _controller.seasonNumbers,
                          itemBuilder: (context, index) {
                            return Text(
                              (index + 1).toString(),
                              style: TextStyle(color: Colors.white),
                            );
                          },
                          onSelectedItemChanged: (index) {
                            _controller.indexSeason = index;
                            print("indexSeason: " + index.toString());
                          },
                        ),
                      ),
                    ],
                  ),
                  elevation: 5,
                  backgroundColor: Colors.black45,
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        _controller.showSerie();
                        Navigator.pop(context);
                      },
                      child: Text(
                        "OK",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                );
              });
        },
      ),
      body: Observer(
        builder: (_) {
          return _controller.showGrid
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
                              SerieModel model = _controller.listContent[index];
                              return Observer(builder: (context) {
                                return Stack(
                                  children: <Widget>[
                                    Card(
                                      elevation: 10,
                                      child: Opacity(
                                        opacity: _controller.opacityCard,
                                        child: Image.network(
                                          model.posterPath,
                                        ),
                                      ),
                                    ),
                                    _controller.showRemoveButton
                                        ? Positioned(
                                            left: 73,
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.remove_circle,
                                                color: Colors.white,
                                              ),
                                              onPressed: () => _controller
                                                  .removeSerie(index),
                                            ))
                                        : Container()
                                  ],
                                );
                              });
                            },
                            childCount: _controller.listContent.length,
                          ),
                        ),
                      ],
                    )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
