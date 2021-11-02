import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/input_cubit.dart';

class SecondExercisePage extends StatelessWidget {
  const SecondExercisePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => InputCubit(),
          child: SecondExercise(),
        ));
  }
}

class SecondExercise extends StatefulWidget {
  const SecondExercise({Key? key}) : super(key: key);

  @override
  State<SecondExercise> createState() => _SecondExercise();
}

class _SecondExercise extends State<SecondExercise> {
  String word = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 6'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InputCubit, String>(
                  bloc: context.read<InputCubit>(),
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter word: ',
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  print(state);
                                  context.read<InputCubit>().capatalise(state);
                                },
                                icon: const Icon(Icons.check_circle_rounded),
                              ),
                            ),
                            onChanged: (String? value) {
                              state = value!;
                            },
                          ),
                        )
                      ],
                    );
                  }),
              BlocBuilder(
                  bloc: context.read<InputCubit>(),
                  builder: (context, state) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        color: Colors.tealAccent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Capatalised: $state',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
