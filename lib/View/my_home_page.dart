import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webproject/Provoider/UserdataProvider.dart';
import 'package:webproject/user_model/user_model.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web View Riverpod"),
        centerTitle: true,
      ),
      body: _data.when(
          data: (_data){
            List<UserModel> userlist = _data.map((e) => e).toList();
           return Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: userlist.length,
                      itemBuilder:(context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            color:  Color(int.parse('FF' + userlist[index].color.toString(), radix: 16)),
                            elevation: 8,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              minLeadingWidth : 10,
                              title: Center(
                                child: Text(
                                 "First Name : "+ userlist[index].firstname.toString(),style: const TextStyle(
                                  color: Colors.black
                                ),
                                ),
                              ),

                              subtitle: Center(
                                child: Text(
                                 "Year of User : " +userlist[index].year.toString(),style: const TextStyle(
                                    color: Colors.black54
                                ),
                                ),
                              ),


                            ),
                          ),
                        );
                      }, ),
                )
              ],
            );
          },
          error: (err,s) => Text(err.toString()),
          loading: () => Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}
