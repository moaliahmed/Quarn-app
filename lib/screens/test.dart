import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/bloc/quran/cubit/quran_cubit.dart';

class TestWidget extends StatefulWidget {
  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        BlocProvider(
          create: (context) => QuranCubit()
            ..calculateSoraname(
              goz2Name: 'الجزء الأول',
            ),
          child: BlocConsumer<QuranCubit, QuranState>(
            listener: (context, state) {},
            builder: (context, state) {
              return state is QuranLoadingState
                  ? CircularProgressIndicator()
                  : Center(
                      child: Text('${QuranCubit.get(context).mySuraName?[1]}'));
            },
          ),
        ),
        IconButton(
            onPressed: () {
              QuranCubit.get(context).calculateSoraname(
                goz2Name: 'الجزء الأول',
              );
            },
            icon: Icon(Icons.replay_outlined))
      ]),
    );
  }
}
