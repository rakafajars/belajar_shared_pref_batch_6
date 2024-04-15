import 'package:belajar_storage_local/model/people_model.dart';
import 'package:belajar_storage_local/splash_page.dart';
import 'package:belajar_storage_local/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? token;
  int? umur;

  PeopleModel? peopleModel;

  void getToken() async {
    token = await SharedPref.getToken();
    setState(() {});
  }

  void getUmur() async {
    umur = await SharedPref.getUmur();
    setState(() {});
  }

  void getPeopleModel() async {
    peopleModel = await SharedPref.getPeopleModel();
    setState(() {});
  }

  @override
  void initState() {
    getToken();
    getUmur();
    getPeopleModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home $token $umur'),
      ),
      body: Column(
        children: [
          Text('${peopleModel?.name}'),
          Text('${peopleModel?.jenisKelamin}'),
          Text('${peopleModel?.email}'),
          Center(
            child: ElevatedButton(
              onPressed: () {
                SharedPref.removeAllKey();
                const snackBar = SnackBar(
                  content: Text(
                    'Log out berhasil',
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SplashPage()),
                  (route) => false,
                );
              },
              child: const Text(
                'Log out',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
