import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

class FirstExercisePage extends StatelessWidget {
  const FirstExercisePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => CounterCubit(),
          child: FirstExercise(),
        ));
  }
}

class FirstExercise extends StatefulWidget {
  const FirstExercise({Key? key}) : super(key: key);

  @override
  State<FirstExercise> createState() => _firstExercise();
}

class _firstExercise extends State<FirstExercise> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 6'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterCubit, int>(
                bloc: context.read<CounterCubit>(),
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Current Count:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      Text(
                        '$state',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  );
                }),
            BlocBuilder(
                bloc: context.read<CounterCubit>(),
                builder: (context, state) {
                  return Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            context.read<CounterCubit>().incrementCounter();
                          },
                          tooltip: 'Increment',
                          child: const Icon(Icons.expand_less),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            context.read<CounterCubit>().decrementCounter();
                          },
                          tooltip: 'Decrement',
                          child: const Icon(Icons.expand_more),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
