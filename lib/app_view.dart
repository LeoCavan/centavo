import 'package:centavo/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';
import 'package:centavo/screens/home/views/home_screen.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Centavo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
            surface: Colors.grey.shade100,
            onSurface: Colors.black,
            primary: const Color(0xFF00B2E7)),
      ),
      home: BlocProvider(
        create: (context) =>
            GetExpensesBloc(FirebaseExpenseRepo())..add(GetExpenses()),
        child: const HomeScreen(),
      ),
    );
  }
}
