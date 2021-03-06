import 'package:expense_manager/chat/home_screen.dart';
import 'package:expense_manager/lent.dart';
import 'package:expense_manager/owe.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';
//import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  final User curr;
  HomeScreen({@required this.curr});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  User curr;
  @override
  void initState() {
    curr = widget.curr;
    super.initState();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(120.0),
            child: AppBar(

              automaticallyImplyLeading: false,
              title: Text("S E T T L E"),
              leading: MaterialButton(
                elevation: 15,
                shape: CircleBorder(),
                color:Colors.white,

                child: Image.asset('images/Asset 3.png', colorBlendMode: BlendMode.colorDodge),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profile(
                              curr: curr,
                            )));
                    //Profile(curr: curr);
                  }),
              backgroundColor: Colors.blue,
              elevation: 0,
              bottom: TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.white),
                  tabs: [
                    /*Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Profile"),
                      ),
                    ),*/
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Owe"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Lent"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Groups"),
                      ),
                    ),
                  ]),
            ),
          ),
          body: TabBarView(children: [
            //Profile(curr: curr),
            OweScreen(curr: curr),
            LentScreen(curr: curr),
            HomeScreen2()
          ]),
        ));
  }
}
