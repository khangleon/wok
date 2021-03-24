import 'package:flutter/material.dart';
import 'package:hello_world/home/controller.dart';
import 'package:hello_world/pt/proto/role/role_message.pb.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final _homeController = Get.put(HomeController());

  HomePage() {
    _homeController.find(filterText: "%a%");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _zoomIn,
            child: Text("+"),
          ),
          InkWell(
              onTap: () {
                _zoomOut();
              },
              child: Container(height: 30, width: 30, color: Colors.red, child: Text("-"))),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(alignment: Alignment.centerLeft, child: Text("Labels")),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildButton(),
            ),
          ),
          _buildBookmark(),
          Row(
            children: [
              Icon(Icons.message),
              Text("17:30"),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildListView(),
                  Obx(
                        () => Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.diagonal3(Vector3(_homeController.scale$.value, _homeController.scale$.value, _homeController.scale$.value)),
                        child: Image.network("https://picsum.photos/536/354")),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _buildBookmark() {
    return Row(
      children: [
        Text("Bookmarks"),
        Expanded(child: Container()),
        Icon(Icons.image),
        Icon(Icons.qr_code),
        Icon(Icons.add),
      ],
    );
  }

  List<Widget> _buildButton() {
    return [
      ElevatedButton(onPressed: () {}, child: Text("+")),
      SizedBox(
        width: 10,
      ),
      ElevatedButton(onPressed: () {}, child: Text("All")),
      SizedBox(
        width: 10,
      ),
      ElevatedButton(onPressed: () {}, child: Text("Cake")),
      SizedBox(
        width: 10,
      ),
      ElevatedButton(onPressed: () {}, child: Text("Fast food")),
      SizedBox(
        width: 10,
      ),
      ElevatedButton(onPressed: () {}, child: Text("Kabab")),
      SizedBox(
        width: 10,
      ),
      ElevatedButton(onPressed: () {}, child: Text("+")),
      SizedBox(
        width: 10,
      ),
      ElevatedButton(onPressed: () {}, child: Text("All")),
      SizedBox(
        width: 10,
      ),
      ElevatedButton(onPressed: () {}, child: Text("Cake")),
      SizedBox(
        width: 10,
      ),
      ElevatedButton(onPressed: () {}, child: Text("Fast food")),
      SizedBox(
        width: 10,
      ),
      ElevatedButton(onPressed: () {}, child: Text("Kabab")),
    ];
  }

  Widget _buildListView() {
    return Obx(() =>
       ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _homeController.data$.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(_homeController.data$[index]);
          }),
    );
  }

  Widget _buildItem(Role role) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(
            Icons.save,
            size: 40,
          ),
          title: Text(
            role.name??'',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(role.code??''),
          trailing: Icon(Icons.list),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 150),
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 8),
          decoration: BoxDecoration(
            color: Colors.blueAccent[100],
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.arrow_back_ios), Text("Cooking"), Icon(Icons.edit)],
              ),
              TextField(
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  filled: true,
                  fillColor: Colors.amber[100],
                  hintText: "Searching......",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _zoomIn() {
    if (_homeController.scale$.value < 5) {
      _homeController.scale$.value++;
    }
  }

  void _zoomOut() {
    if (_homeController.scale$.value > 1) {
      _homeController.scale$.value--;
    }
  }
}