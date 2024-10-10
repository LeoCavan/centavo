import 'package:centavo/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
import 'package:centavo/screens/add_expense/views/add_expense.dart';
import 'package:centavo/screens/stats/stats.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        // ),

        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            backgroundColor: Colors.white,
            fixedColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.house_fill), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.graph_square_fill),
                  label: 'Dashboard'),
            ]),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => BlocProvider(
                    create: (context) =>
                        CreateCategoryBloc(FirebaseExpenseRepo()),
                    child: const AddExpense(),
                  ),
                ));
          },
          child: const Icon(CupertinoIcons.add),
        ),
        body: index == 0 ? const MainScreen() : const StatScreen());
  }
}
