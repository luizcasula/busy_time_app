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
                        SliverAppBar(
                          expandedHeight: 200.0,
                          floating: false,
                          pinned: true,
                          title: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(top: 32),
                            child: Column(
                              children: <Widget>[
                                //Text("BUSY TIME"),
                                Text(
                                  "Series",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ),
                          flexibleSpace: FlexibleSpaceBar(),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            padding: EdgeInsets.all(16),
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
                              ContentModel model =
                                  _controller.listContent[index];
                              return Card(
                                child: SizedBox(
                                  child: Image.network(model.posterPath),
                                ),
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
