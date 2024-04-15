import 'package:belajar_storage_local/home_page.dart';
import 'package:belajar_storage_local/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController umurController = TextEditingController();
  int? umur;

  TextEditingController nameController = TextEditingController();
  TextEditingController jenisKelaminController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void getUmur() async {
    umur = await SharedPref.getUmur();
    setState(() {});
  }

  @override
  void initState() {
    getUmur();
    super.initState();
  }

  @override
  void dispose() {
    loginController.dispose();
    umurController.dispose();
    nameController.dispose();
    jenisKelaminController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login dengan shared pref $umur'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: loginController,
              decoration: const InputDecoration(
                hintText: 'Username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: umurController,
              decoration: const InputDecoration(
                hintText: 'Umur',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: jenisKelaminController,
              decoration: const InputDecoration(
                hintText: 'Jenis Kelamin',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (loginController.text.isEmpty) {
                const snackBar = SnackBar(
                  content: Text(
                    'Username tidak boleh kosong',
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                SharedPref.saveToken(
                  token: loginController.text,
                );

                SharedPref.saveUmur(
                  umur: int.parse(
                    umurController.text,
                  ),
                );

                await SharedPref.savePeopleModel(
                  name: nameController.text,
                  jenisKelamin: jenisKelaminController.text,
                  email: emailController.text,
                );

                if (context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                }
              }
            },
            child: const Text(
              'Login',
            ),
          )
        ],
      ),
    );
  }
}
