import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_task/screens/splash_screen.dart';
import 'package:internative_task/screens/home/viewmodel/home_view_model.dart';
import 'package:internative_task/screens/profile/view/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await _homeViewModel.getUsers();
    await _homeViewModel.getMe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: 20),
          icon: Icon(
            Icons.account_circle_outlined,
            color: Colors.black,
            size: 32,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilView(userId: _homeViewModel.profileData!.data!.id, isMyProfile: true),
              ),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.blue[100],
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 24),
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () => {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  content: const Text('Çıkmak istediğinize emin misiniz?'),
                  actions: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[400],
                        onPrimary: Colors.white,
                        shape: StadiumBorder(),
                      ),
                      child: Text(
                        "İptal",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "WorkSansSemiBold",
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[300],
                        onPrimary: Colors.white,
                        shape: StadiumBorder(),
                      ),
                      child: Text(
                        "Çıkış",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "WorkSansSemiBold",
                        ),
                      ),
                      onPressed: () async {
                        await _homeViewModel.logOut();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
                          return SplashScreen();
                        }));
                      },
                    ),
                  ],
                ),
              )
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.blue[100],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: Observer(builder: (_) {
                    if (_homeViewModel.profileData == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: _homeViewModel.userList.length,
                      itemBuilder: (context, index) {
                        var user = _homeViewModel.userList[index];
                        if (user.id == _homeViewModel.profileData?.data!.id) {
                          return Container();
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                  user.fullName!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProfilView(
                                          userId: user.id,
                                        ),
                                      ));
                                },
                                trailing: IconButton(
                                  onPressed: () {
                                    var userId = user.id!;
                                    if (!_homeViewModel.myFriends.contains(userId)) {
                                      _homeViewModel.addFriend(userId);
                                      final snackBar = SnackBar(
                                        content: Text('${user.firstName} arkadaş eklendi'),
                                        duration: Duration(seconds: 1),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    } else {
                                      _homeViewModel.removeFriend(userId);
                                      final snackBar = SnackBar(
                                        content: Text('${user.firstName} arkadaşlıktan çıkarıldı'),
                                        duration: Duration(seconds: 1),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    }
                                  },
                                  icon: Observer(builder: (_) {
                                    return Icon(
                                      _homeViewModel.myFriends.contains(_homeViewModel.userList[index].id)
                                          ? Icons.person_remove_outlined
                                          : Icons.person_add_outlined,
                                      color: _homeViewModel.myFriends.contains(_homeViewModel.userList[index].id)
                                          ? Colors.red
                                          : Colors.blue,
                                      size: 30,
                                    );
                                  }),
                                ),
                                leading: CircleAvatar(
                                  radius: 26.0,
                                  backgroundImage: NetworkImage(
                                    _homeViewModel.userList[index].profilePhoto!,
                                  ),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
