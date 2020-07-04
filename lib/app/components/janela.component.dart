import 'package:flutter/material.dart';
import 'package:palavras/app/models/menu/menu.model.dart';

class JanelaComponent extends StatelessWidget {
  final List<MenuModel> menuList = [];

  final Widget child;
  final Widget floatingActionButton;
  final String title;
  final context;

  JanelaComponent(
      {this.child,
      this.floatingActionButton,
      @required this.title,
      @required this.context});

  void goTo(MenuModel menuModel) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => menuModel.widget));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  'Aplicativo do Bell e da Mell <3',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            Container(
              height: 400,
              child: ListView.separated(
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(menuList[index].titulo),
                    onTap: () => goTo(menuList[index]),
                  );
                },
                itemCount: menuList.length,
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            ),
          ],
        ),
      ),
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }
}
