import 'package:api_calls_lists_flutter/api_call.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Users>> users;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    users = getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Api Calls in Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<Users>>(
            future: users,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name),
                        subtitle: Text(snapshot.data![index].email),
                        trailing: Text(snapshot.data![index].username),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    ));
  }
}

// this code down shows how you can load a local json file just copy it directly to the.
// ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:anim_search_bar/anim_search_bar.dart';
// import 'dart:convert';

// import 'package:flutter/services.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Hide the debug banner
//       debugShowCheckedModeBanner: false,
//       title: 'this section read a local json file',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List _items = [];

//   // Fetch content from the json file
//   Future<void> readJson() async {
//     final String response =
//         await rootBundle.loadString('assets/user_data.json');
//     final data = await json.decode(response);
//     setState(() {
//       _items = data["users"];
//     });
//   }

//   TextEditingController textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'read a json local file',
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Column(
//           children: [
//             AnimSearchBar(
//               width: 400,
//               textController: textController,
//               onSuffixTap: () {
//                 setState(() {
//                   textController.clear();
//                 });
//               },
//               animationDurationInMilli: 1000,
//               helpText: "find don....",
//               autoFocus: true,
//             ),
//             ElevatedButton(
//               onPressed: readJson,
//               child: const Text('Load Data'),
//             ),

//             // Display the data loaded from sample.json
//             _items.isNotEmpty
//  /               ? Expanded(
//                     child: ListView.builder(
//                       itemCount: _items.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           margin: const EdgeInsets.all(10),
//                           child: ListTile(
//                             leading: Text(_items[index]["name"]),
//                             title: Text(_items[index]["location"]),
//                             subtitle: Text(_items[index]["booldtype"]),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 : Container()
//           ],
//         ),
//       ),
//     );
//   }
// }
