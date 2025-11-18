import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_frontend/functions/get_image_urls.dart';
import 'package:my_frontend/models/pokemon_model.dart';

import '../functions/parse_pokemon.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> postRequest(String number) async {
    final resonse = await dio.post(
      'http://127.0.0.1:8001/pokedex/api/',
      data: {'number': number},
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    return resonse.data;
  }

  TextEditingController numberController = TextEditingController();

  String pokemonNumber = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokedex'),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
            future: postRequest(pokemonNumber),
            builder: (BuildContext context,
                AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                Map<String, dynamic> data = snapshot.data!;
                Pokemon pokemon = parsePokemon(data['pokemon'], pokemonNumber);
                String imagePath = getImageUrl(pokemon.type);
                return Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    pokemon.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 200,
                    child: Image.asset(imagePath),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () async {
                        // pokemonNumber = (Random().nextInt(151) + 1).toString();
                        pokemonNumber = (Random().nextInt(100) + 1).toString();

                        await postRequest(pokemonNumber);
                        setState(() {});
                      },
                      child: const Text('randomize')),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        hintText: 'Enter Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      pokemonNumber = numberController.text;
                      await postRequest(pokemonNumber);
                      setState(() {});
                    },
                    child: const Text('Search'),
                  )
                ]);
              }
              return Container(
                child: const Center(child: Text('No data found')),
              );
            }));
  }
}
