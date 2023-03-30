import 'package:bloc01/bloc/CounterWithBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPageBloc extends StatefulWidget {
  const SecondPageBloc({Key? key}) : super(key: key);

  @override
  _SecondPageBlocState createState() => _SecondPageBlocState();
}

class _SecondPageBlocState extends State<SecondPageBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPageBloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().decrement(),
        child: const Icon(Icons.remove),
      ),
    );
  }
}
