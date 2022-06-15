import 'package:flutter/material.dart';

import 'package:isitaword/isitaword.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String query = "";
  int flag = 0;

  void onSubmit(String word) {
    if (isItAWord(word)) {
      flag = 1; //this means that the word is legit
    } else {
      flag = -1; //this mean that the word is not legit
    }

    setState(() {});
  }

  OutlineInputBorder outlineInputBorder({Color color = Colors.white}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: color,
          width: 5,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter a combination of bunch of english letters!',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            //textfield to read the input of english letters from the user
            TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                border: outlineInputBorder(),
                errorBorder: outlineInputBorder(),
                enabledBorder: outlineInputBorder(),
                focusedBorder: outlineInputBorder(
                  color: Colors.green,
                ),
                disabledBorder: outlineInputBorder(),
                focusedErrorBorder: outlineInputBorder(),
              ),
              cursorHeight: 22,
              cursorColor: Colors.white,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                  ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorWidth: 2,
              keyboardType: TextInputType.text,
              //as soon as the user submits the textfield using his keyboard button, this function will be called
              onFieldSubmitted: onSubmit,
              onChanged: (val) {
                query = val;
              },
              validator: (query) {
                if (query!.isEmpty) {
                  return "This field cannot be empty";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            (flag == 0)
                ? const SizedBox()
                : Text(
                    (flag == 1)
                        ? 'Yes! It is a word'
                        : 'Nope! That\'s not a word',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ],
        ),
      ),
    );
  }
}
